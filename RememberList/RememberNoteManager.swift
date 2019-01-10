//
//  RememberNoteModel.swift
//  RememberList
//
//  Created by Benjamin Poulsen PRO on 1/10/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//
import UIKit
import Foundation
import CoreData


class RememberNoteManager {
    
    let context: NSManagedObjectContext
    
    let appDelegate: AppDelegate
    
    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
        self.context = appDelegate.persistentContainer.viewContext
    }
    func fetchData() -> [RememberNote] {
        let request = NSFetchRequest<RememberNote>(entityName: "RememberNote")
        // also do :NSFetchRequest = List.request
        do {
            return try context.fetch(request)
        } catch {
            return []
        }
    }
    func create(noteText: String) -> RememberNote {
        let rememberNote = RememberNote(context: appDelegate.persistentContainer.viewContext)
        rememberNote.text = noteText
        return rememberNote
    }
    func save() {
        appDelegate.saveContext()
    }
    func delete(listItemToDelete: RememberNote) {
        context.delete(listItemToDelete)
    }
}
