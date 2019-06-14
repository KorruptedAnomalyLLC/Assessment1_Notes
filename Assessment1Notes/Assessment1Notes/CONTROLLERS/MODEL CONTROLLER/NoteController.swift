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
    
    init() {
        loadFromPersistentStorage()
    }
    
    // Source of Truth
    var notes: [Note] = []
    
    func addEntryWith(title: String, text: String) {
        // Appending/adding the note to the notes source of truth, which applies it to the Note model
        let note = Note(noteTitle: title, noteText: text)
        notes.append(note)
        // Don't forget to add this
        saveToPersistentStorage()
    }
    
    func remove(note: Note) {
        // Searches for an index point/location of an entry and then removes it from the notes array
        if let noteIndex = notes.firstIndex(of: note) {
            notes.remove(at: noteIndex)
            saveToPersistentStorage()
        }
    }
    
    func update(note: Note, with title: String, text: String) {
        
        note.noteTitle = title
        note.noteText = text
        saveToPersistentStorage()
    }
    
    //    Persistence
    //    make this a snippet!
    func createFileURLForPersistence() -> URL {
        //        grab the users document directory
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //        Create the new fileURL on the user's device
        let fileURL = urls[0].appendingPathComponent("Assessment1Notes.json")
        return fileURL
    }
    
    //    Persistence
    //    method signatures (CALL THESE)
    func saveToPersistentStorage() {
        //        Create an instance of JSONEncoder
        let jsonEncoder = JSONEncoder()
        //        Attempt to convert our playlists to JSON
        do {
            let jsonEntry = try jsonEncoder.encode(notes)
            //            with the new json(d) playlist, save it to the file we created
            try jsonEntry.write(to: createFileURLForPersistence())
        } catch let encodingError {
            //            Handle the error if there is one
            print("There was an error saving the data as JSON!! \(encodingError.localizedDescription)")
            
        }
        
    }
    
    func loadFromPersistentStorage() {
        
        //        The data we want will be JSON, and I want it to be a Playlist
        let jsonDecoder = JSONDecoder()
        //        Decode the data
        do {
            
            let jsonData = try Data(contentsOf: createFileURLForPersistence())
            let decodedNotes = try jsonDecoder.decode([Note].self, from: jsonData)
            notes = decodedNotes
            self.notes = decodedNotes
        } catch let decodingError {
            print("There was an error decoding!! \(decodingError.localizedDescription)")
        }
        
    }
    
    
}
