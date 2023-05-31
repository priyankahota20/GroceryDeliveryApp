//
//  HomeOnSaleItemView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import SwiftUI

struct HomeOnSaleItemView: View {
    @StateObject var homeItemData = HomeViewModel()
    @State var isOnSaleView: Bool = false
    
    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 15) {
                if isOnSaleView {
                ForEach(homeItemData.onSaleItem){item in
                    HomeItemView(navigateToProductDetails: false, item: $homeItemData.onSaleItem[getIndex(item: item, isOnsale: true)])
                }
                } else {
                    ForEach(homeItemData.orderAgainItem){item in
                        HomeItemView(navigateToProductDetails: false, item: $homeItemData.orderAgainItem[getIndex(item: item, isOnsale: false)])
                    }
                }
            }
            .padding([.leading, .bottom, .top],20)
        }

    }
    
    func getIndex(item: HomeItem, isOnsale: Bool) -> Int{
     if isOnsale {
        return homeItemData.onSaleItem.firstIndex {(item1) -> Bool in
            return item.id == item1.id
        } ?? 0
     } else {
         return homeItemData.orderAgainItem.firstIndex {(item1) -> Bool in
             return item.id == item1.id
         } ?? 0
     }
    }
}

struct HomeOnSaleItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeOnSaleItemView()
    }
}
