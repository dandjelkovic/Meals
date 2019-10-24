//
//  MealsTests.swift
//  MealsTests
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import XCTest
import CoreData
@testable import Meals

class MealsTests: XCTestCase {
    var context: NSManagedObjectContext!

    override func setUp() {
        super.setUp()
        context = setupCoreDataStack()
        let today = Current.date()
        for _ in 1...3 {
            let meal = Meal(entity: Meal.entity(), insertInto: context)
            meal.weight = [Weight.light, Weight.medium, Weight.heavy].randomElement()!
            meal.timestamp = today
            try! context.save()
        }
        for _ in 1...3 {
            let meal = Meal(entity: Meal.entity(), insertInto: context)
            meal.weight = [Weight.light, Weight.medium, Weight.heavy].randomElement()!
            meal.timestamp = Calendar.current.date(byAdding: .day, value: -1, to: today)!
            try! context.save()
        }
        for _ in 1...3 {
            let meal = Meal(entity: Meal.entity(), insertInto: context)
            meal.weight = [Weight.light, Weight.medium, Weight.heavy].randomElement()!
            meal.timestamp = Calendar.current.date(byAdding: .day, value: -2, to: today)!
            try! context.save()
        }

//        lookupMeals()
    }

    private func setupCoreDataStack() -> NSManagedObjectContext {
        //        let testContainer = NSPersistentContainer(name: "MockMeals")
        //        testContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
        //            if let error = error as NSError? {
        //                fatalError("Unresolved error \(error), \(error.userInfo)")
        //            }
        //        })
        //        let modelURL = Bundle.main.url(forResource: "Meals", withExtension: "xcdatamodeld")!
        let model: NSManagedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        try! coordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)

        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }

    private func lookupMeals() {
        do {
            let fetchRequest : NSFetchRequest<Meal> = Meal.fetchRequest()
            let fetchedResults = try context.fetch(fetchRequest) 
            print(fetchedResults)

        }
        catch {
            print ("fetch task failed", error)
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testdaysByRowOfThree() {
        let statisticsView = Statistics()
        XCTAssertEqual(statisticsView.daysByRowOfThree.count, 3)
        
    }


}
