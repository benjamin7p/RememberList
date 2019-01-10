//
//  ListTableViewController.swift
//  RememberList
//
//  Created by Benjamin Poulsen PRO on 1/7/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit
import CoreData

class ListTableViewController: UITableViewController {
    
    let rememberNoteManager = RememberNoteManager(appDelegate: UIApplication.shared.delegate as! AppDelegate)
    
    var rememberNoteList = [RememberNote]()
    
    func loadList() -> [RememberNote] {
        return rememberNoteManager.fetchData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        rememberNoteList = loadList()
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rememberNoteList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) 
            
        
        cell.textLabel?.text = rememberNoteList[indexPath.row].text
        

        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            rememberNoteList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            let listItemToDelete = rememberNoteList[indexPath.row]
            rememberNoteManager.delete(listItemToDelete: listItemToDelete)
            rememberNoteManager.save()
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destinationVC = segue.destination as? DetailViewController else { return }
        destinationVC.delegate = self
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}

extension ListTableViewController: RememberNoteDelegate {
    
    func saveText(text: String) {
        let newNoteText = rememberNoteManager.create(noteText: text)
        rememberNoteManager.save()
        rememberNoteList = rememberNoteManager.fetchData()
        tableView.reloadData()
    }
    
}
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

 


