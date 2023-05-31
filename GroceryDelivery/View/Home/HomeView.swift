//
//  HomeView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                HomeBannerView()
                Spacer(minLength: 30)
                HomeSectionHeaderView(headerTitle: "On sale")
                HomeOnSaleItemView(isOnSaleView: true)
                HomeSectionHeaderView(headerTitle: "Categories")
                HomeCategoryView()
                HomeSectionHeaderView(headerTitle: "Order again")
                HomeOnSaleItemView(isOnSaleView: false)
                }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
