//
//  AddPizza.swift
//  PizzaApp
//
//  Created by Nuvin Godakanda Arachchi on 2023-03-01.
//

import SwiftUI

struct AddPizza: View {
    
    @ObservedObject var viewModel: PizzaViewModel
    @State private var pizzaName = ""
    @State private var ingredients = ""
    @State private var imageName = ""
    @State private var pizzaType = ""
    @State private var isFavourite = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $pizzaName)
                } header: {
                    Text("Pizza Name")
                }
                Section {
                    TextEditor(text: $ingredients).frame(height: 100)
                } header: {
                    Text("Ingredients")
                }
                Section {
                    TextField("Image Link", text: $imageName)
                } header: {
                    Text("Image Details")
                }
                Section {
                    TextField("Pizza Type", text: $pizzaType)
                } header: {
                    Text("Pizza Type")
                }
                Toggle("Favourite", isOn: $isFavourite)
            }
            .navigationTitle("New Pizza")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .accentColor(.red)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.addPizzaData(name: pizzaName, ingredients: ingredients, pizzaType: pizzaType, imageName: imageName, isFavourite: isFavourite)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddPizza_Previews: PreviewProvider {
    static var previews: some View {
        AddPizza(viewModel: PizzaViewModel())
    }
}
