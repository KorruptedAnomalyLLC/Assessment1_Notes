//
//  Note.swift
//  Assessment1Notes
//
//  Created by Austin West on 6/14/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

class Note: Equatable, Codable {
    
    // var timestamp: Date()
    var noteTitle: String
    var noteText: String
    
    init(noteTitle: String, noteText: String) {
        self.noteTitle = noteTitle
        self.noteText = noteText
    }
    
    static func == (lhs: Note, rhs: Note) -> Bool {
        if lhs.noteTitle == rhs.noteTitle { return true }
        if lhs.noteText == rhs.noteText { return true }
        
        return false
    }
    
    
    // Curious if there really is a difference between checking for != compared to just ==
   /* static func == (lhs: Note, rhs: Note) -> Bool {
        if lhs.noteTitle != rhs.noteTitle { return false }
        if lhs.noteText != rhs.noteText { return false }
        
        return true
    }
 */
    
    
    
}
