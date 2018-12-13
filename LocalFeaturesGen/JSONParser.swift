//
//  JSONParser.swift
//  LocalFeaturesGen
//
//  Created by Taras Kreknin on 12/12/2018.
//  Copyright © 2018 DocDoc. All rights reserved.
//

import Foundation

enum Keys: String {
    case features = "features"
    case jiraKey = "id"
    case uniqueId = "uniqueId"
    case label = "label"
    case isLocal = "isLocal"
    case defaultValue = "defaultValue"
}

struct JSONParser {
    
    static func parseFeatures(rootJson: String) -> [JSONFeature] {
        guard let jsonData = rootJson.data(using: .utf8) else {
            printMessage("Failed to get data from string:\n\(rootJson)")
            printHelpAndExit(success: false)
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any],
            let featuresJson = json?[Keys.features.rawValue] as? [[String: Any]] else {
                printMessage("Failed to read JSON from:\n\(rootJson)")
                printHelpAndExit(success: false)
        }
        
        return featuresJson.map(JSONFeature.fromRaw)
    }
    
}
