//
//  HomeSectionHeaderView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import SwiftUI

struct HomeSectionHeaderView: View {
    @State var headerTitle: String
    var body: some View {
        HStack {
            Text(headerTitle)
                .font(.system(size: 18, weight: .bold, design: .rounded))
            Spacer()
            Text("Show all")
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundColor(.gray)
        }.padding(20)
    }
}

struct HomeSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSectionHeaderView(headerTitle: "On Sale")
    }
}
