//
//  FavouritesView.swift
//  PizzaApp
//
//  Created by Nuvin Godakanda Arachchi on 2023-03-01.
//

import SwiftUI

struct FavouritesView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Add pizzas to your favourites to view them here")
            }
        }
        .navigationTitle("Favourites")
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
