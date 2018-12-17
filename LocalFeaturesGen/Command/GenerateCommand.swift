//
//  GenerateCommand.swift
//  LocalFeaturesGen
//
//  Created by Taras Kreknin on 13/12/2018.
//  Copyright © 2018 DocDoc. All rights reserved.
//

import Foundation

struct GenerateCommand: Command {
    
    static let name = "generate"
    
    let inputPath: String
    let outputPath: String
    
    init(params: [String]) {
        guard let indexOfInputPathParam = params.firstIndex(of: "--input"),
            let indexOfOutputPathParam = params.firstIndex(of: "--output") else {
                printMessage("--input or --output param is not found")
                printHelpAndExit(success: false)
        }
        
        inputPath = params[indexOfInputPathParam + 1]
        outputPath = params[indexOfOutputPathParam + 1]
    }
    
    func execute() {
        let jsonString: String
        do {
            jsonString = try IOUtils.readContentsOfFile(at: inputPath)
        } catch (let error) {
            printMessage("Can't read from \(inputPath). \(error.localizedDescription)")
            exit(1)
        }
        
        let generated = generateFileFrom(rawJson: jsonString)
        let changed = checkIfContentChanged(newContent: generated)
        
        if !changed {
            printMessage("No changes in features, skipping")
            exit(0)
        }
        
        IOUtils.removeFile(at: outputPath)
        
        do {
            try IOUtils.writeString(generated, to: outputPath)
            printMessage("LocalFeatures.swift generated and saved to \(outputPath)")
        } catch (let error) {
            printMessage("Can't write to \(outputPath). \(error.localizedDescription)")
            exit(1)
        }
    }
    
    func generateFileFrom(rawJson: String) -> String {
        let features = JSONParser.parseFeatures(rootJson: rawJson)
        
        let featureTemplates = features.map(TemplateRenderer.renderFeature).joined(separator: "\n")
        let variableNames = features.map { $0.jiraKey }.joined(separator: ",\n            ")
        
        return TemplateRenderer.render(template: Templates.file, substitutions: [
            TemplateSubstitutions.featureDeclarations: featureTemplates,
            TemplateSubstitutions.featureVariableNames: variableNames
            ])
    }
    
    private func checkIfContentChanged(newContent: String) -> Bool {
        do {
            let oldContent = try IOUtils.readContentsOfFile(at: outputPath)
            return oldContent != newContent
        } catch {
            return true
        }
    }
    
}
