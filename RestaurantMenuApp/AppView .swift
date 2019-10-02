//
//  AppView .swift
//  RestaurantMenuApp
//
//  Created by Donkemezuo Raymond Tariladou on 10/2/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import SwiftUI

struct AppView_: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Order")
            }
            
            OrdersView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
        }
    }
}
