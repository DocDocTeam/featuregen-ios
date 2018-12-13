//
//  Global.swift
//  LocalFeaturesGen
//
//  Created by Taras Kreknin on 13/12/2018.
//  Copyright © 2018 DocDoc. All rights reserved.
//

import Foundation

private let logTag = "⚙️ featuregen: "

func printHelpAndExit(success: Bool) -> Never {
    PrintHelpCommand().execute()
    return exit(success ? 1 : 0)
}

func printMessage(_ message: String) {
    print("\(logTag) \(message)")
}
