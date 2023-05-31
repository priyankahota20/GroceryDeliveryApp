//
//  CategoryViewModel.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import Foundation

class CategoriesViewModel: ObservableObject {
   @Published var generalItems = [
        CategoryItem(name: "New in", image: "newIn", categoryType: "general"),
        CategoryItem(name: "Super sale", image: "sale", categoryType: "general")
    ]
    
    @Published var foodItems = [
         CategoryItem(name: "Bakery", image: "bakery", categoryType: "food"),
         CategoryItem(name: "Fruits", image: "fruits", categoryType: "food"),
         CategoryItem(name: "Meat", image: "meat", categoryType: "food"),
         CategoryItem(name: "Fish", image: "fish", categoryType: "food"),
         CategoryItem(name: "Vegetables", image: "vegetables", categoryType: "food"),
         CategoryItem(name: "Dairy", image: "dairy", categoryType: "food"),
         CategoryItem(name: "Sweets", image: "sweet", categoryType: "food"),
         CategoryItem(name: "Snacks", image: "snack", categoryType: "food")
     ]
    
    @Published var beveragesItems = [
         CategoryItem(name: "Alcohol", image: "alcohol", categoryType: "beverages"),
         CategoryItem(name: "Juices", image: "juices", categoryType: "beverages"),
         CategoryItem(name: "Coffee", image: "coffee", categoryType: "beverages"),
         CategoryItem(name: "Soda", image: "soda", categoryType: "beverages")
    ]
    
    @Published var othersItems = [
         CategoryItem(name: "Pharmacy", image: "pharmacy", categoryType: "other"),
         CategoryItem(name: "Beauty", image: "beauty", categoryType: "other"),
         CategoryItem(name: "Toiletries", image: "toiletries", categoryType: "other"),
         CategoryItem(name: "Household", image: "household", categoryType: "other")
    ]
    
    @Published var homeCategoryItems = [
        CategoryItem(name: "New in", image: "newIn", categoryType: "general"),
        CategoryItem(name: "Super sale", image: "sale", categoryType: "general"),
        CategoryItem(name: "Bakery", image: "bakery", categoryType: "food"),
        CategoryItem(name: "Fruits", image: "fruits", categoryType: "food"),
        CategoryItem(name: "Meat", image: "meat", categoryType: "food"),
        CategoryItem(name: "Fish", image: "fish", categoryType: "food"),
        CategoryItem(name: "Vegetables", image: "vegetables", categoryType: "food"),
        CategoryItem(name: "Dairy", image: "dairy", categoryType: "food")
    ]
}
