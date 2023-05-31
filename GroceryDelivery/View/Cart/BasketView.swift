//
//  BasketView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/30/23.
//

import SwiftUI

struct BasketView: View {
    @Binding var tabSelection: Int
    var body: some View {
            CartView(tabSelection: $tabSelection, navigateToOrderTrackDetails: false, isComingFromDetailsPage: false)
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(tabSelection: .constant(1))
    }
}
