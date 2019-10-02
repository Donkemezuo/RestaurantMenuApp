//
//  ItemDetailView.swift
//  RestaurantMenuApp
//
//  Created by Donkemezuo Raymond Tariladou on 10/2/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {

    var menuItem: MenuItem
    @EnvironmentObject var order: Order
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) { // The ZStack is used to handle overlapping views
            Image(menuItem.mainImage)
                Text("PC \(menuItem.photoCredit)")
                .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                .offset(x: -5, y: -3)
            }

        Text(menuItem.description)
            .padding()
            Button("Order") {
                self.order.add(item: self.menuItem)
            }.font(.headline).foregroundColor(Color.red)
            Spacer()
        }.navigationBarTitle(Text(menuItem.name), displayMode: .inline)
        
}
}

