//
//  CategoryModel.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import Foundation

struct CategoryItem: Identifiable{
    
    var id = UUID().uuidString
    var name: String
    var image: String
    var categoryType: String
}

