//
//  ACCCategory.swift
//  AACBoard
//
//  Created by Javier on 17/09/2026.
//

import Foundation
import SwiftData

@Model
final class AACCategory {
    @Attribute(.unique) var id: UUID
    var name: String
    var hexColor: String
    var sortOrder: Int
    
    // Relación 1 a N: Si se elimina la categoría, se eliminan sus pictogramas asociados
    @Relationship(deleteRule: .cascade, inverse: \AACPictogram.category)
    var pictograms: [AACPictogram]
    
    init(
        id: UUID = UUID(),
        name: String,
        hexColor: String,
        sortOrder: Int = 0,
        pictograms: [AACPictogram] = []
    ) {
        self.id = id
        self.name = name
        self.hexColor = hexColor
        self.sortOrder = sortOrder
        self.pictograms = pictograms
    }
}
