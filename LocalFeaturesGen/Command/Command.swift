//
//  Command.swift
//  LocalFeaturesGen
//
//  Created by Taras Kreknin on 13/12/2018.
//  Copyright © 2018 DocDoc. All rights reserved.
//

import Foundation

protocol Command {
    
    static var name: String { get }
    
    func execute()
    
}
