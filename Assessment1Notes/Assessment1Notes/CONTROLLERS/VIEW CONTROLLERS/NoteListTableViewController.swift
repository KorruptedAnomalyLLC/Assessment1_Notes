//
//  NoteListTableViewController.swift
//  Assessment1Notes
//
//  Created by Austin West on 6/14/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class NoteListTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var noteSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //search bar
        noteSearchBar.delegate = self
        noteSearchBar.returnKeyType = UIReturnKeyType.done
        
        // Reload the table
        tableView.reloadData()
 
    }

    @IBAction func editButtonTapped(_ sender: Any) {
        
        if self.tableView.isEditing == false {
            self.tableView.isEditing = true
        } else {
            self.tableView.isEditing = false
        }
       
    }
    
    
    // Don't forget this or the tableview won't update
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //search bar
        
        return NoteController.shared.notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        let note = NoteController.shared.notes[indexPath.row]
        cell.textLabel?.text = note.noteTitle
        cell.detailTextLabel?.text = note.noteText
        

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source when you swipe right to left
            let nc = NoteController.shared
            let note = nc.notes[indexPath.row]
            nc.remove(note: note)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    //Test for rearranging
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "toShowNote" {
            
            if let detailViewController = segue.destination as? NoteDetailViewController,
                let selectedRow = tableView.indexPathForSelectedRow?.row {
                
                let note = NoteController.shared.notes[selectedRow]
                detailViewController.note = note
            }
        }
    }

}
