//
//  OrdersView.swift
//  RestaurantMenuApp
//
//  Created by Donkemezuo Raymond Tariladou on 10/2/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import SwiftUI

struct OrdersView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$ \(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text ("Place order")
                    }
                }
            }
            
        .navigationBarTitle("Order")
        .listStyle(GroupedListStyle())
        }

    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
