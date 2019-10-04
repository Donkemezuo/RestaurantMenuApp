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
    static let tipAmounts = [10,15,20,25,0]

    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
   
    
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
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0..<Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
            }
            
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")")) {
                Button("Confirm order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) { // This creates an alert controller
            Alert(title: Text("Order Confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("Ok"))) // This is the alert action
        }
    }
}
