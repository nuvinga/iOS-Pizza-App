//
//  PizzaViewModel.swift
//  PizzaApp
//
//  Created by Nuvin Godakanda Arachchi on 2023-03-10.
//

import Foundation
import CoreData

class PizzaViewModel: ObservableObject {
    
    @Published var savedPizzaData: [PizzaEntity] = []
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "PizzaDataModel")
        container.loadPersistentStores { description, error in
            if let error = error{
                print("Error in loading core data. \(error)")
            } else {
                print("Successfully loaded core data.")
            }
        }
        fetchData() // loads initial data
    }
    
    func fetchData() {
        let request = NSFetchRequest<PizzaEntity>(entityName: "PizzaEntity")
        do {
            savedPizzaData = try container.viewContext.fetch(request)
            print("Successfully fetched data.")
        } catch let error {
            print("Error in fetching data. \(error)")
        }
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchData() // after saving => fetch the data again
            print("Successfully saved data")
        } catch let error {
            print("Error in saving data. \(error)")
        }
    }
    
    func addPizzaData(name: String, ingredients: String, pizzaType: String, imageName: String, isFavourite: Bool) {
        let newPizza = PizzaEntity(context: container.viewContext)
        newPizza.name = name
        newPizza.ingredients = ingredients
        newPizza.pizzaType = pizzaType
        newPizza.imageName = imageName
        newPizza.isFavourite = isFavourite
        saveData()
    }
    
    func fetchPizzaByType(toppingId: Int) -> [PizzaEntity] {
        if toppingId == 1 {
            return savedPizzaData.filter { $0.pizzaType == "Meat" }
        } else if toppingId == 2 {
            return savedPizzaData.filter { $0.pizzaType == "vegetarian" }
        }
        return savedPizzaData
    }
    
    func deletePizza(pizza: NSManagedObjectID) {
        print("DELETE DATA: \(pizza)")
    }
    
//    func updateIsFavourite(pizza)
    
    
}
