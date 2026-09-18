//
//  PreloadDataService.swift
//  AACBoard
//
//  Created by Javier on 18/09/2026.
//

import SwiftData

@MainActor
struct PreloadDataService {
    
    static func insertSeedData(into context: ModelContext) throws {
        if try hasExistingData(in: context) {
            print("Datos semilla ya existentes")
        } else {
            let categories = buildSeedModels()
            for category in categories {
                context.insert(category)
            }
            try context.save()
        }
    }
    
    private static func hasExistingData(in context: ModelContext) throws -> Bool {
        return try context.fetchCount(FetchDescriptor<AACCategory>()) > 0
    }
    
    private static func buildSeedModels() -> [AACCategory] {
        var result: [AACCategory] = [
            AACCategory(
                name: "Personas",
                hexColor: "#FFEB3B",
                pictograms: [
                    AACPictogram(
                        arasaacID: 1,
                        keyword: "Yo"
                    ),
                    AACPictogram(
                        arasaacID: 2,
                        keyword: "Tú"
                    )
                ]
            ),
            AACCategory(
                name: "Acciones",
                hexColor: "#4CAF50",
                pictograms: [
                    AACPictogram(
                        arasaacID: 100,
                        keyword: "Comer"
                    ),
                    AACPictogram(
                        arasaacID: 101,
                        keyword: "Beber"
                    )
                ]
            ),
            AACCategory(
                name: "Objetos",
                hexColor: "#FF9800",
                pictograms: [
                    AACPictogram(
                        arasaacID: 200,
                        keyword: "Agua"
                    ),
                    AACPictogram(
                        arasaacID: 201,
                        keyword: "Pan"
                    )
                ]
            )
        ]
        return result
    }
}
