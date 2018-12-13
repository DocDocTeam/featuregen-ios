//
//  IOUtils.swift
//  LocalFeaturesGen
//
//  Created by Taras Kreknin on 13/12/2018.
//  Copyright © 2018 DocDoc. All rights reserved.
//

import Foundation

struct IOUtils {
    
    static func readContentsOfFile(at path: String) throws -> String {
        let url = URL(fileURLWithPath: path)
        return try String(contentsOf: url)
    }
    
    static func writeString(_ string: String, to path: String) throws {
        try string.write(toFile: path, atomically: false, encoding: .utf8)
    }
    
    static func removeFile(at path: String) {
        let manager = FileManager.default
        
        do {
            try manager.removeItem(atPath: path)
        } catch let error {
            printMessage("File at \"\(path)\" was not deleted. \(error.localizedDescription)")
        }
    }
}
