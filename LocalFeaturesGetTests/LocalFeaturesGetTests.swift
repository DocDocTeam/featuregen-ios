//
//  LocalFeaturesGetTests.swift
//  LocalFeaturesGetTests
//
//  Created by Taras Kreknin on 12/12/2018.
//  Copyright © 2018 DocDoc. All rights reserved.
//

import XCTest


class LocalFeaturesGetTests: XCTestCase {

    private let testBundle = Bundle(for: LocalFeaturesGetTests.self)
    private let tempOutputFile = NSTemporaryDirectory() + "LocalFeatures.swift"
    
    override func setUp() {
    }

    override func tearDown() {
        IOUtils.removeFile(at: tempOutputFile)
    }

    func testGivenNoSubstitution_WhenRenderTemplate_ThenReturnsClearedTemplate() {
        let template = "no substitutions \(TemplateSubstitutions.featureDeclarations)"
        let result = TemplateRenderer.render(template: template, substitutions: [:])
        XCTAssertEqual(result, "no substitutions ")
    }
    
    func testGivenEmptyFeatures_WhenGenerate_ThenSwiftFileHasNoFeatures() {
        let inputPath = testBundle.path(forResource: "empty_features", ofType: "json")!
        let expectedOutputPath = testBundle.path(forResource: "empty_features", ofType: "txt")!
        let params = generateCammandParams(input: inputPath, output: tempOutputFile)
        let program = Program()
        program.run(params: params)
        
        let generated = try! IOUtils.readContentsOfFile(at: tempOutputFile)
        let expected = try! IOUtils.readContentsOfFile(at: expectedOutputPath)

        XCTAssertEqual(generated, expected)
    }
    
    func testGivenFeatures1_WhenGenerate_ThenSwiftFileFeatures1() {
        let inputPath = testBundle.path(forResource: "features1", ofType: "json")!
        let expectedOutputPath = testBundle.path(forResource: "features1", ofType: "txt")!
        let params = generateCammandParams(input: inputPath, output: tempOutputFile)
        let program = Program()
        program.run(params: params)
        
        let generated = try! IOUtils.readContentsOfFile(at: tempOutputFile)
        let expected = try! IOUtils.readContentsOfFile(at: expectedOutputPath)
        print(generated)
        XCTAssertEqual(generated, expected)
    }
    
}

extension LocalFeaturesGetTests {
    
    func generateCammandParams(input: String, output: String) -> [String] {
        return ["dummy",
                GenerateCommand.name,
                "--input", input,
                "--output", output]
    }
    
}
