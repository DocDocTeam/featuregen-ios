# featuregen-ios
Generates LocalFeatures.swift from features.json

# Usage
`featuregen generate --input <path to features json file> --output <path to output swift file>`

# Sample JSON
```
{
  "features": [
    {
      "id": "diagnostic",
      "uniqueId": 1,
      "label": "Диагностика",
      "isLocal": true,
      "defaultValue": false
    },
    {
      "id": "search",
      "uniqueId": 16238,
      "label": "Поиск по заболеваниям",
      "isLocal": true,
      "defaultValue": false
    }
  ]
}
```
# Sample output
```
//
//  Created by LocalFeaturesGen.
//  !!!DO NOT MODIFY MANUALLY!!!
//  Copyright © 2018 DocDoc. All rights reserved.
//

import Foundation

struct LocalFeatures {

    // swiftlint:disable all
    static let diagnostic = LocalFeature(uniqueId: 1, name: "Диагностика", enabledByDefault: false)
    static let search = LocalFeature(uniqueId: 16238, name: "Поиск по заболеваниям", enabledByDefault: false)
    static var list: [LocalFeature] {
        return [
            diagnostic,
            search
        ]
    }
}
```
