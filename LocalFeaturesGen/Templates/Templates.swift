//
//  Templates.swift
//  LocalFeaturesGen
//
//  Created by Taras Kreknin on 12/12/2018.
//  Copyright © 2018 DocDoc. All rights reserved.
//

import Foundation

struct TemplateSubstitutions {
    static let variableName = "@@variableName@@"
    static let id = "@@id@@"
    static let featureDescr = "@@name@@"
    static let featureDeclarations = "@@declarations@@"
    static let featureVariableNames = "@@names@@"
    static let featureDefaultValue = "@@default@@"
    
    static let all = [variableName, id, featureDescr, featureDeclarations, featureVariableNames, featureDefaultValue]
}

struct Templates {
    static let file = localFeaturesFileTemplate
    static let feature = localFeatueTemplate
}

private let localFeaturesFileTemplate = """
//
//  Created by LocalFeaturesGen.
//  !!!DO NOT MODIFY MANUALLY!!!
//  Copyright © 2018 DocDoc. All rights reserved.
//

import Foundation

struct LocalFeatures {

    // swiftlint:disable all
\(TemplateSubstitutions.featureDeclarations)
    static var list: [LocalFeature] {
        return [
            \(TemplateSubstitutions.featureVariableNames)
        ]
    }
}
"""

private let localFeatueTemplate = """
    static let \(TemplateSubstitutions.variableName) = LocalFeature(uniqueId: \(TemplateSubstitutions.id), name: \"\(TemplateSubstitutions.featureDescr)\", enabledByDefault: \(TemplateSubstitutions.featureDefaultValue))
"""
