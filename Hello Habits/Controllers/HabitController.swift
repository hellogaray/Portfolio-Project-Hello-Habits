//
//  HabitController.swift
//  Hello, Habits!
//
//  Created by Leonel Garay on 11/12/23.
//

import SwiftUI
import CoreData

class HabitController: ObservableObject {
    let container = NSPersistentContainer(name: "HabitModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to Load Data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved.")
        } catch let saveError as NSError {
            print("Could not Save Data: \(saveError), \(saveError.userInfo)")
            
            // Print detailed information about the objects causing the issue
            if let updatedObjects = saveError.userInfo[NSDetailedErrorsKey] as? [NSManagedObject] {
                for object in updatedObjects {
                    print("Object with ID: \(object.objectID) could not be saved.")
                    for (key, value) in object.changedValues() {
                        print("Attribute \(key) = \(value)")
                    }
                }
            }
        } catch {
            print("Unexpected error during save.")
        }
    }

    
    func addHabit(title: String, isReminderOn: Bool, context: NSManagedObjectContext) {
        print("Before creating Habit object")


        let habit = Habit(context: context)
        habit.id = UUID()
        habit.title = title
        habit.isReminderOn = isReminderOn

        save(context: context)
    }


    
    func editHabit(habit: Habit, title: String, isReminderOn: Bool, context: NSManagedObjectContext) {
        habit.title = title
        habit.isReminderOn = isReminderOn

        save(context: context)
    }
}
