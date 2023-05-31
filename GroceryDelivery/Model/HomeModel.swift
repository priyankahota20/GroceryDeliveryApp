//
//  HomeModel.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import Foundation

struct HomeItem: Identifiable {
    
    var id = UUID().uuidString
    let name: String
    let imgName: String
    var isLiked: Bool = false
    var price: Double
    var type: String
    var beforeDiscountPrice: Double
    var discountPercentage: Double = 0.0
}
