//
//  CheckoutView.swift
//  RestaurantMenuApp
//
//  Created by Donkemezuo Raymond Tariladou on 10/2/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit Card", "Customer Points"]
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    
    var body: some View {
        Form {
                Section {
                    Picker("How do you want to pay?", selection: $paymentType) {
                        ForEach(0..<Self.paymentTypes.count) {
                            Text(Self.paymentTypes[$0])
                        }
                    }
                    
                    Toggle(isOn: $addLoyaltyDetails.animation()) {
                        Text("Add customer loyalty card")
                    }
                    
                    if addLoyaltyDetails {
                    TextField("Enter your customer ID ", text: $loyaltyNumber)
                    }
                    
                }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}
