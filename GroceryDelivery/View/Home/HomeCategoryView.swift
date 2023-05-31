//
//  HomeCategoryView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import SwiftUI

struct HomeCategoryView: View {
    @StateObject var categoryData = CategoriesViewModel()

    let coloumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: coloumns, spacing: 20) {
                    ForEach(categoryData.homeCategoryItems) {item in
                        CategoryItemView(item: $categoryData.homeCategoryItems[getIndex(item: item, type: "food")])
                }
            }
        }.padding([.bottom], 20)
    }
    func getIndex(item: CategoryItem, type: String) -> Int{
        return categoryData.homeCategoryItems.firstIndex {(item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
}

struct HomeCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategoryView()
    }
}
