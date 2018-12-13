//
//  JsonFeature.swift
//  LocalFeaturesGen
//
//  Created by Taras Kreknin on 12/12/2018.
//  Copyright © 2018 DocDoc. All rights reserved.
//

import Cocoa

enum JSONFeatureError: Error {
    case cantParse
}

struct JSONFeature {
    let id: Int
    let jiraKey: String
    let description: String
    let defaultValue: Bool
}

extension JSONFeature {
    
    static func fromRaw(json: [String: Any]) -> JSONFeature {
        let id = json[Keys.uniqueId.rawValue] as! Int
        let jiraKey = json[Keys.jiraKey.rawValue] as! String
        let label = json[Keys.label.rawValue] as! String
        let defaultValue = json[Keys.defaultValue.rawValue] as! Bool
        
        return JSONFeature(id: id,
                           jiraKey: jiraKey,
                           description: label,
                           defaultValue: defaultValue)
    }
    
}
