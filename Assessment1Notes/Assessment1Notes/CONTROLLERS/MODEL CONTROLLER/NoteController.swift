//
//  NoteController.swift
//  Assessment1Notes
//
//  Created by Austin West on 6/14/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

class NoteController {
    
    // Singleton
    static let shared = NoteController()
    
    // Source of Truth
    var notes: [Note] = []
    
    func addEntryWith(title: String, text: String) {
        // Appending/adding the note to the notes source of truth, which applies it to the Note model
        let note = Note(noteTitle: title, noteText: text)
        notes.append(note)
    }
    
    func remove(note: Note) {
        // Searches for an index point/location of an entry and then removes it from the notes array
        if let noteIndex = notes.firstIndex(of: note) {
            notes.remove(at: noteIndex)
        }
    }
    
    func update(note: Note, with title: String, text: String) {
        
        note.noteTitle = title
        note.noteText = text
    }
    
    
    
}
