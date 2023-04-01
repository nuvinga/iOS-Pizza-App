//
//  PizzaList.swift
//  PizzaApp
//
//  Created by Nuvin Godakanda Arachchi on 2023-03-01.
//

import SwiftUI

struct PizzaList: View {
    
    @ObservedObject var viewModel: PizzaViewModel
    @State private var isSheetShowing = false
    @State private var selectedTopping = 0
    var toppings = ["All🍕", "Meat🥩", "Veggie🥗"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Toppings", selection: $selectedTopping) {
                    Text("All🍕").tag(0)
                    Text("Meat🥩").tag(1)
                    Text("Veggie🥗").tag(2)
                }
                .pickerStyle(.segmented)
                
                List {
                    ForEach(viewModel.fetchPizzaByType(toppingId: selectedTopping)) { pizza in
                        NavigationLink {
                            SinglePizzaView(pizza: pizza, viewModel: viewModel)
                        } label: {
                            HStack(alignment: .center) {
                                Image("\(pizza.imageName ?? "")")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                VStack(alignment: .leading) {
                                    Text("\(pizza.name ?? "")")
                                        .font(.headline)
                                        .multilineTextAlignment(.leading)
                                    Text("\(pizza.ingredients ?? "")")
                                        .font(.footnote)
                                        .fontWeight(.thin)
                                }
                                Spacer()
                                if (pizza.isFavourite) {
                                    Image(systemName: "heart")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        isSheetShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                AddPizza(viewModel: viewModel)
            }
            .navigationTitle("Pizzas")
        }
    }
}

struct PizzaList_Previews: PreviewProvider {
    static var previews: some View {
        PizzaList(viewModel: PizzaViewModel())
    }
}
