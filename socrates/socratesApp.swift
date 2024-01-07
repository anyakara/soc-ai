//
//  socratesApp.swift
//  socrates
//
//  Created by Ananya Karra on 7/16/22.
//

import SwiftUI

@main
struct socratesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
