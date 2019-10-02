//
//  ContentView.swift
//  RestaurantMenuApp
//
//  Created by Donkemezuo Raymond Tariladou on 10/2/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import SwiftUI

struct ContentView: View { // This is the only screen in our app
    // All views are structs and all views must conform to the view protocol
    
    let restaurantMenu = Bundle.main.decode([MenuSection].self, from: "menu.json") // This creates our array of items in the restaurant menu
    var body: some View { // a computed property that returns the actual layout of the view
        
        NavigationView { // This embeds our view into a navigation view controller
        List { // This creates a list of items (tableview wise)
            ForEach(restaurantMenu) { sectionInMenu in // This creates a list of all our sections in our restaurant menu
                Section(header:Text(sectionInMenu.name)){ // This makes our section text
                    ForEach(sectionInMenu.items) { itemInSection in // This creates the various items in our sections
                        Text(itemInSection.name)
                }

                }
            }

    }
    .navigationBarTitle("Menu") // This is a modifier of NavigationView
    .listStyle(GroupedListStyle()) // This creates indented list style

            
            }    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
