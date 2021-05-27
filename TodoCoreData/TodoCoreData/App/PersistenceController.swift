//
//  PersistenceController.swift
//  TodoCoreData
//
//  Created by Yusuf Turan on 14.05.2021.
//

import Foundation
import CoreData

public class PersistentCloudKitContainer {
  // MARK: - Define Constants / Variables
  public static var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  // MARK: - Initializer
  private init() {}
  // MARK: - Core Data stack
  public static var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Todo")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    container.viewContext.automaticallyMergesChangesFromParent = true
    container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    return container
  }()
}
