//
//  Persistence.swift
//  ToDoApp
//
//  Created by Yusuf Turan on 13.05.2021.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()



    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ToDoApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
