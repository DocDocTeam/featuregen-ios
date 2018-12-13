//
//  Program.swift
//  LocalFeaturesGen
//
//  Created by Taras Kreknin on 12/12/2018.
//  Copyright © 2018 DocDoc. All rights reserved.
//

import Foundation

class Program {
    
    func run(params: [String]) {
        if params.count < 2 {
            printHelpAndExit(success: false)
        }
        
        switch params[1] {
        case PrintHelpCommand.name:
            printHelpAndExit(success: true)
        case GenerateCommand.name:
            let generateParams = Array(params.dropFirst(2))
            GenerateCommand(params: generateParams).execute()
        default:
            printHelpAndExit(success: false)
        }
    }
    
}
