//
//  DBManager.swift
//  Lidavi_Assignment
//
//  Created by Viswanath on 10/02/23.
//

import UIKit
import CoreData

class DBManager{
    static let share = DBManager()
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Lidavi_Assignment")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
      lazy var context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func fetchDetails() -> [Details]{
        var details = [Details]()
        
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Details.description())
        do{
            details = try persistentContainer.viewContext.fetch(fetchRequest) as! [Details]
        }
        catch{
            print("fetching error")
        }
        return details
    }
    
}
