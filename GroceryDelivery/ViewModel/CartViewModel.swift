//
//  CartViewModel.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import Foundation


class CartItemViewModel: ObservableObject {
    @Published var items = [
         CartItem(name: "Donut", image: "donut", price: 2.97, quantity: 3, unit: ""),
         CartItem(name: "Peas", image: "peas", price: 1.64, quantity: 50, unit: "g"),
         CartItem(name: "Oranges", image: "orange", price: 4, quantity: 2, unit: "")
     ]
}
