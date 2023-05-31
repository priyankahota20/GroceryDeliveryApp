//
//  CategoryItemView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import SwiftUI

struct CategoryItemView: View {
    @Binding var item: CategoryItem
    var body: some View {
        HStack {
            NavigationLink(destination: VegetableView().navigationBarHidden(false).accentColor(.black)) {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 25)
            Text(item.name)
                .frame(width: 90, alignment: .leading)
                .foregroundColor(.black)
            }
                
        }
        .frame(width: 155, height: 40)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 1.0, x: 0, y: 0)
    }
}


