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
    
    func addHabit(title: String, isReminderOn: Bool, reminderTime: Date?, selectedDays: [Int], context: NSManagedObjectContext) {
        let habit = Habit(context: context)
        habit.id = UUID()
        habit.title = title
        habit.isReminderOn = isReminderOn
        habit.reminderTime = reminderTime
        habit.selectedDays = selectedDays.map { String($0) }.joined(separator: ",")
        save(context: context)
    }
    
    func editHabit(habit: Habit, title: String, isReminderOn: Bool, reminderTime: Date?, selectedDays: [Int], context: NSManagedObjectContext) {
        habit.title = title
        habit.isReminderOn = isReminderOn
        habit.reminderTime = reminderTime
        habit.selectedDays  = selectedDays.map { String($0) }.joined(separator: ",")
        save(context: context)
    }
    
    
    func deleteHabit(habit: Habit, context: NSManagedObjectContext) {
        context.delete(habit)
        save(context: context)
    }
    
    func getHabits(context: NSManagedObjectContext) -> [Habit] {
        do {
            let request = NSFetchRequest<Habit>(entityName: "Habit")
            return try context.fetch(request)
        } catch {
            print("Error fetching habits: \(error)")
            return []
        }
    }
    
    func updateHabitsForToday(context: NSManagedObjectContext) -> [Habit] {
        let todayIndex = Calendar.current.component(.weekday, from: Date()) - 1
        let habits = getHabits(context: context)
        
        let filteredHabits = habits.filter { habit in
            guard let selectedDays = habit.selectedDays else { return false }
            let selectedDaysArray = selectedDays.components(separatedBy: ",").compactMap { Int($0) }
            return selectedDaysArray.contains(todayIndex)
        }
        
        return filteredHabits
    }
}
