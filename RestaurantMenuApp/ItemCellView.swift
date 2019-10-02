//
//  ItemCellView.swift
//  RestaurantMenuApp
//
//  Created by Donkemezuo Raymond Tariladou on 10/2/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import SwiftUI

struct ItemCellView: View {
    var menuItem: MenuItem
     var colors: [String: Color] = ["D":.purple, "G": .black, "N":.red, "S": .blue, "V": .green]
    var body: some View {
        
        NavigationLink(destination: ItemDetailView(menuItem: menuItem)) { // This creates a segue for a cell
        HStack { // This is a container view that places our views side by side
            Image(menuItem.thumbnailImage).clipShape(Circle())
            VStack(alignment: .leading) { // This vertical container view helps put our price and item name side by side
                Text(menuItem.name).font(.headline)
                Text("$ \(menuItem.price)").font(.subheadline)
            }.layoutPriority(1)
            
            Spacer()
            
            ForEach(menuItem.restrictions, id: \.self) { restriction in // id: \.self means that the string itself is its own ID
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(self.colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
                
                
            }
        
        }

    }
}
}
//struct ItemCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemCellView()
//    }
//}
