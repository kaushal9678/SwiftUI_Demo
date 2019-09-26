//
//  OrderView.swift
//  DemoApp
//
//  Created by Kaushal on 25/09/19.
//  Copyright © 2019 Kaushlendra Yadav. All rights reserved.
//

import SwiftUI

struct OrderView: View {
	@EnvironmentObject var order:Order
    var body: some View {
		 NavigationView {
				   List {
					   Section {
						   ForEach(order.items) { item in
							   HStack {
								   Text(item.name)
								   Spacer()
								   Text("$\(item.price)")
							   }
						   }.onDelete(perform: deleteItems)
					   }

					   Section {
						   NavigationLink(destination: CheckoutView()) {
							   Text("Place Order")
						   }
					   }
				   }
				   .navigationBarTitle("Order")
				.listStyle(GroupedListStyle())
				.navigationBarItems(trailing: EditButton())
				.disabled(order.items.isEmpty)
			
			   }
		   }
	func deleteItems(at offsets: IndexSet) {
		order.items.remove(atOffsets: offsets)
	}
}

struct OrderView_Previews: PreviewProvider {
	static let order = Order()
    static var previews: some View {
		OrderView().environmentObject(order);
    }
}
