//
//  Framework.swift
//  Floating Panel
//
//  Created by Mohamed Mostafa on 10/09/2024.
//

import Foundation

struct Framework {
    var id = UUID()
    let name: String
}

struct MockData {
    static let frameworks = [
        Framework(name: "App Clips"),
        Framework(name: "ARKit"),
        Framework(name: "CarPlay"),
        Framework(name: "Catalyst"),
        Framework(name: "ClassKit"),
        Framework(name: "CloudKit"),
        Framework(name: "Core ML"),
        Framework(name: "HealthKit"),
        Framework(name: "Metal"),
        Framework(name: "SF Symbols"),
        Framework(name: "SiriKit"),
        Framework(name: "SpriteKit"),
        Framework(name: "SwiftUI"),
        Framework(name: "Test Flight"),
        Framework(name: "Wallet"),
        Framework(name: "WidgetKit"),
    ]
}
