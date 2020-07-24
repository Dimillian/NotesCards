//
//  Notes.swift
//  NotesCards
//
//  Created by Thomas Ricouard on 02/07/2020.
//

import Foundation

struct Note: Identifiable {
    let id = UUID().uuidString
    let name: String
    let creationDate: Date
    let lastModified: Date
    
    init(name: String) {
        self.name = name
        self.creationDate = Date()
        self.lastModified = Date()
    }
}
