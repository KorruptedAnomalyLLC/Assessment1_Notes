//
//  NoteDetailViewController.swift
//  Assessment1Notes
//
//  Created by Austin West on 6/14/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    var note: Note? {
        didSet {
            if isViewLoaded { updateViews() }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let text = noteTextView.text, let title = noteTitleTextField.text else { return }
        
        if let note = self.note {
            NoteController.shared.update(note: note, with: text, text: text)
        } else {
            NoteController.shared.addEntryWith(title: title, text: text)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard let note = note else { return }
        noteTitleTextField.text = note.noteTitle
        noteTextView.text = note.noteText
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
