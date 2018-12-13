//
//  PrintHelpCommand.swift
//  LocalFeaturesGen
//
//  Created by Taras Kreknin on 12/12/2018.
//  Copyright © 2018 DocDoc. All rights reserved.
//

import Foundation

struct PrintHelpCommand: Command {
    
    static let name = "help"
    
    func execute() {
        print("====================================USAGE=======================================|")
        print("| featuregen generate --input <features.json path> --output <output path>")
        print("|===================================OR==========================================|")
        print("| featuregen help")
        print("================================================================================|")
    }
    
}
