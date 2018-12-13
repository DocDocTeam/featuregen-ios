//
//  TemplateRenderer.swift
//  LocalFeaturesGen
//
//  Created by Taras Kreknin on 12/12/2018.
//  Copyright © 2018 DocDoc. All rights reserved.
//

import Foundation

struct TemplateRenderer {
    
    static func render(template: String, substitutions: [String: String]) -> String {
        var result = template
        substitutions.forEach { key, value in
            result = result.replacingOccurrences(of: key, with: value)
        }
        
        TemplateSubstitutions.all.forEach { sub in
            result = result.replacingOccurrences(of: sub, with: "")
        }
        
        return result
    }
    
    static func renderFeature(_ feature: JSONFeature) -> String {
        let substitutions = [TemplateSubstitutions.variableName : feature.jiraKey,
                             TemplateSubstitutions.id : "\(feature.id)",
                             TemplateSubstitutions.featureDescr : feature.description,
                             TemplateSubstitutions.featureDefaultValue : "\(feature.defaultValue)"]
        
        return TemplateRenderer.render(template: Templates.feature, substitutions: substitutions)
    }
}
