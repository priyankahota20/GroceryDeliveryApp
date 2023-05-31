//
//  CategoryView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var categoryData = CategoriesViewModel()
    
    let coloumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func headerView(categoryType: String) -> some View {
        HStack {
            Text(categoryType)
                .padding(.all, 10)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
                .background(Color.white)
            Spacer()
            
            Image(systemName: "chevron.down")
                .resizable()
                .scaledToFit()
                .frame(width: 10, alignment: .trailing)
                .offset(x: -15)
        }
        .frame(maxWidth: .infinity,maxHeight: 40)
    }
    
    var body: some View {
            ScrollView {
                HStack {
                    Text("Categories")
                        .padding(.all, 10)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                        .background(Color.white)
                    Spacer()
                }
                LazyVGrid(columns: coloumns, spacing: 0) {
                    ForEach(categoryData.generalItems) {item in
                        CategoryItemView(item: $categoryData.generalItems[getIndex(item: item, type: "general")])
                        
                    }
                }

                
                LazyVGrid(columns: coloumns, spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section(header: headerView(categoryType: "Food")) {
                        ForEach(categoryData.foodItems) {item in
                            CategoryItemView(item: $categoryData.foodItems[getIndex(item: item, type: "food")])
                        }
                    }
                }
                
                LazyVGrid(columns: coloumns, spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section(header: headerView(categoryType: "Beverages")) {
                        ForEach(categoryData.beveragesItems) {item in
                            CategoryItemView(item: $categoryData.beveragesItems[getIndex(item: item, type: "beverages")])
                        }
                    }
                }

                
                LazyVGrid(columns: coloumns, spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section(header: headerView(categoryType: "Others")) {
                        ForEach(categoryData.othersItems) {item in
                            CategoryItemView(item: $categoryData.othersItems[getIndex(item: item, type: "others")])
                        }
                    }
                }
                .padding(.bottom)
            }
            .navigationBarTitle("Categories")
    }
    
    func getIndex(item: CategoryItem, type: String) -> Int{
        if type == "general" {
            return categoryData.generalItems.firstIndex {(item1) -> Bool in
                return item.id == item1.id
            } ?? 0
        } else if type == "food" {
            return categoryData.foodItems.firstIndex {(item1) -> Bool in
                return item.id == item1.id
            } ?? 0
        } else if type == "beverages" {
            return categoryData.beveragesItems.firstIndex {(item1) -> Bool in
                return item.id == item1.id
            } ?? 0
        } else {
            return categoryData.othersItems.firstIndex {(item1) -> Bool in
                return item.id == item1.id
            } ?? 0
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
