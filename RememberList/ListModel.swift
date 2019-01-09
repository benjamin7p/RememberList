//
//  ListModel.swift
//  RememberList
//
//  Created by Benjamin Poulsen PRO on 1/8/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation
import CoreData

class ListModel {
    let appDelegate: AppDelegate
    
    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }
    func fetchData() -> [List] {
        let request = NSFetchRequest<List>(entityName: "List")
        // also do :NSFetchRequest = List.request
        do {
            return try appDelegate.persistentContainer.viewContext.fetch(request)
        } catch {
            return []
        }
    }
    func createList(name: String) {
        let list = List(context: appDelegate.persistentContainer.viewContext)
        list.name = name
    }
    func saveList() {
        appDelegate.saveContext()
    }
}

// let list = name(context: contextHelper(app deleget method) .context)
// list.name = "whatever name"
// list.name = NNSet(array: [name])
// try? contextHelper.context.save
