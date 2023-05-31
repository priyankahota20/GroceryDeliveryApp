//
//  CategoriesView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/30/23.
//

import SwiftUI

struct CategoriesView: View {
    @Binding var tabSelection: Int
    var body: some View {
        CategoryView()
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(tabSelection: .constant(1))
    }
}
