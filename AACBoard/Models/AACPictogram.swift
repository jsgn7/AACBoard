//
//  AACPictogram.swift
//  AACBoard
//
//  Created by Javier on 17/09/2026.
//

import Foundation
import SwiftData

@Model
final class AACPictogram {
    @Attribute(.unique) var id: UUID
    var arasaacID: Int
    var keyword: String
    var imagePath: String?
    var sortOrder: Int
    
    // Relación opcional inversa hacia la categoría
    var category: AACCategory?
    
    init(
        id: UUID = UUID(),
        arasaacID: Int,
        keyword: String,
        imagePath: String? = nil,
        sortOrder: Int = 0,
        category: AACCategory? = nil
    ) {
        self.id = id
        self.arasaacID = arasaacID
        self.keyword = keyword
        self.imagePath = imagePath
        self.sortOrder = sortOrder
        self.category = category
    }
}
