//
//  CheckoutView.swift
//  DemoApp
//
//  Created by Kaushal on 25/09/19.
//  Copyright © 2019 Kaushlendra Yadav. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
	@EnvironmentObject var order:Order
	
	static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
	
	@State private var paymentType = 0
	@State private var addLoyaltyDetails = false
	@State private var loyaltyNumber = ""
	static let tipAmounts = [10, 15, 20, 25, 0]
	@State private var tipAmount = 1
   var body: some View {
		Form {
			Section {
				Picker("How do you want to pay?", selection: $paymentType) {
					ForEach(0 ..< Self.paymentTypes.count) {
						Text(Self.paymentTypes[$0])
					}
				}
				Toggle(isOn: $addLoyaltyDetails.animation()) {
					Text("Add iDine loyalty card")
				}

				if addLoyaltyDetails {
					TextField("Enter your iDine ID", text: $loyaltyNumber)
				}
			}
			Section(header: Text("Add a tip?")) {
				Picker("Percentage:", selection: $tipAmount) {
					ForEach(0 ..< Self.tipAmounts.count) {
						Text("\(Self.tipAmounts[$0])%")
					}
				}.pickerStyle(SegmentedPickerStyle())
			}
			Section(header:
				Text("TOTAL: $100")
			) {
				Button("Confirm order") {
					// place the order
				}
			}
		}
		.navigationBarTitle(Text("Payment"), displayMode: .inline)
	}
}

struct CheckoutView_Previews: PreviewProvider {
	static let order = Order()
    static var previews: some View {
		CheckoutView().environmentObject(order);
    }
}