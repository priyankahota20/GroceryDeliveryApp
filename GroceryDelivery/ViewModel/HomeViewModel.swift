//
//  HomeViewModel.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var onSaleItem = [
        HomeItem(name: "Apple", imgName: "apple", price: 2.0, type: "sale", beforeDiscountPrice: 4.0, discountPercentage: 10.0),
        HomeItem(name: "Orange", imgName: "oranges", price: 3.0, type: "sale", beforeDiscountPrice: 4.0, discountPercentage: 20.0),
        HomeItem(name: "Watermelon", imgName: "watermelon", price: 10.0, type: "sale", beforeDiscountPrice: 12.0, discountPercentage: 30.0),
        HomeItem(name: "Mango", imgName: "mango", price: 2.0, type: "sale", beforeDiscountPrice: 3.0, discountPercentage: 40.0),
        HomeItem(name: "Banana", imgName: "banana", price: 4.0, type: "sale", beforeDiscountPrice: 5.0, discountPercentage: 30)
    ]
    
    @Published var orderAgainItem = [
        HomeItem(name: "Cucumber", imgName: "cucumber", price: 2.0, type: "orderAgain", beforeDiscountPrice: 4.0),
        HomeItem(name: "Broccoli", imgName: "brocoli", price: 4.0, type: "orderAgain", beforeDiscountPrice: 6.0),
        HomeItem(name: "Peas", imgName: "peass", price: 6.0, type: "orderAgain", beforeDiscountPrice: 8.0),
        HomeItem(name: "Spinach", imgName: "spinach", price: 8.0, type: "orderAgain", beforeDiscountPrice: 10.0)
    ]
    
    @Published var favouriteItem = [
        HomeItem(name: "Mango", imgName: "mango", isLiked: true, price: 6.0, type: "favourite", beforeDiscountPrice: 8.0, discountPercentage: 30.0),
        HomeItem(name: "Banana", imgName: "banana", isLiked: true, price: 4.0, type: "favourite", beforeDiscountPrice: 5.0, discountPercentage: 20.0),
        HomeItem(name: "Donut", imgName: "donutt", isLiked: true, price: 4.0, type: "favourite", beforeDiscountPrice: 6.0, discountPercentage: 40),
        HomeItem(name: "Choclate", imgName: "choclate", isLiked: true, price: 15.0, type: "favourite", beforeDiscountPrice: 18.0, discountPercentage: 20.0),
        HomeItem(name: "Orange", imgName: "oranges", isLiked: true, price: 3.0, type: "favourite", beforeDiscountPrice: 4.0, discountPercentage: 10.0),
        HomeItem(name: "Grapes", imgName: "grapes", isLiked: true, price: 1.0, type: "favourite", beforeDiscountPrice: 1.0, discountPercentage: 30.0),
        HomeItem(name: "Watermelon", imgName: "watermelon", isLiked: true, price: 10.0, type: "favourite", beforeDiscountPrice: 12.0, discountPercentage: 20.0)
    ]
    
    @Published var vegetableItem = [
        HomeItem(name: "Cucumber", imgName: "cucumber", price: 6.0, type: "vegetable", beforeDiscountPrice: 8.0),
        HomeItem(name: "Brocoli", imgName: "brocoli", price: 4.0, type: "vegetable", beforeDiscountPrice: 5.0),
        HomeItem(name: "Brinjal", imgName: "brinjal", price: 4.0, type: "vegetable", beforeDiscountPrice: 6.0),
        HomeItem(name: "Potato", imgName: "potato", price: 15.0, type: "vegetable", beforeDiscountPrice: 18.0),
        HomeItem(name: "Spinach", imgName: "spinach", price: 3.0, type: "vegetable", beforeDiscountPrice: 4.0),
        HomeItem(name: "Tomato", imgName: "tomato", price: 1.0, type: "vegetable", beforeDiscountPrice: 1.0),
        HomeItem(name: "Peas", imgName: "peas", price: 10.0, type: "vegetable", beforeDiscountPrice: 12.0)
    ]
}
