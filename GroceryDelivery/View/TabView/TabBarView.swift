//
//  TabBarView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/30/23.
//

import SwiftUI

struct TabBarView: View {
    @State var tabSelection = 1
    
    var body: some View {
        NavigationView{
            TabView(selection: $tabSelection) {
                HomeView()
                    .navigationBarHidden(true)
                    .tabItem({
                        Image(systemName: "house.fill")
                        
                    }).tag(1)
                    
                
                CategoriesView(tabSelection: $tabSelection)
                    .navigationBarHidden(true).navigationBarTitle("")
                    .tabItem({
                        Image(systemName: "list.bullet")
                            .foregroundColor(.red)
                            .accentColor(.red)
                            .colorMultiply(.red)
                    }).tag(2)
                
                FavouriteView()
                    .navigationBarHidden(true).navigationBarTitle("")
                    .tabItem({
                        Image(systemName: "heart.fill")
                    }).tag(3)
                    
                
                BasketView(tabSelection: $tabSelection)
                    .navigationBarHidden(true).navigationBarTitle("")
                    .tabItem({
                        Image(systemName: "cart")
                            .accentColor(.gray)
                            .colorMultiply(.gray)
                        
                    }).tag(4)
            }
           
        }.accentColor(.black)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
