//
//  AACBoardApp.swift
//  AACBoard
//
//  Created by Javier on 17/09/2026.
//

import SwiftUI
import SwiftData

@main
struct AACBoardApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([AACCategory.self, AACPictogram.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    do {
                        try PreloadDataService.insertSeedData(into: sharedModelContainer.mainContext)
                    } catch {
                        print("Error al generar el modelo de datos: \(error)")
                    }
                }
        }
        .modelContainer(sharedModelContainer)
    }
}
