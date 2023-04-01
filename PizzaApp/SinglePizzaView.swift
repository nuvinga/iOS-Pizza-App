//
//  SinglePizzaView.swift
//  PizzaApp
//
//  Created by Nuvin Godakanda Arachchi on 2023-03-10.
//

import SwiftUI
import CoreData

struct SinglePizzaView: View {
    
    var pizza: PizzaEntity
    @ObservedObject var viewModel: PizzaViewModel
    @State var isFavourite: Bool
    
    init(pizza: PizzaEntity, viewModel: PizzaViewModel) {
        self.pizza = pizza
        self.viewModel = viewModel
        self.isFavourite = pizza.isFavourite
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("\(pizza.imageName ?? "")")
                    .resizable()
                    .frame(height: 200)
                
                Form {
                    Section {
                        Text("\(pizza.ingredients ?? "")")
                            .multilineTextAlignment(.leading)
                    } header: {
                        Text("Ingredients")
                    }
                    
                    Toggle("Favourite", isOn: $isFavourite)
                }
            }
            .navigationTitle("\(pizza.name ?? "")")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

//struct SinglePizzaView_Previews: PreviewProvider {
//    static var previews: some View {
//        SinglePizzaView(pizza: PizzaEntity(), viewModel: PizzaViewModel())
//    }
//}
