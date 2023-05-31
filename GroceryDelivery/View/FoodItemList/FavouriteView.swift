//
//  FavouriteView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/30/23.
//

import SwiftUI


struct FavouriteView: View {
    var body: some View {
        ZStack {
            FavouriteItemView()
        }
    }
}

struct FavouriteItemView: View {
    
    @StateObject var favouriteItemData = HomeViewModel()
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Text("Favourties")
                        .padding(.all, 12)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                        .background(Color.white)
                    Spacer()
                }
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(favouriteItemData.favouriteItem) { item in
                        VStack(spacing: 8) {
                            HStack{
                                Button(action: {
                                    favouriteButtonClicked(item)
                                }) {
                                    Image( item.isLiked ? "heart_check" : "heart_uncheck")
                                }
                                Spacer()
                                Text("-\(Int(item.discountPercentage))%")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.white)
                                    .frame(height: 25)
                                    .frame(maxWidth: 50)
                                    .background(
                                        RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.init(red: 218.0/255.0, green: 32.0/255.0, blue: 32.0/255))
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 50, style: .continuous)
                                            .strokeBorder(Color.init(red: 218.0/255.0, green: 32.0/255.0, blue: 32.0/255), lineWidth: 1)
                                    )
                                
                            }
                            
                            Image(item.imgName)
                                .resizable()
                                .frame(width: 130, height: 100)
                            
                            HStack{
                                Text(item.name)
                                Spacer()
                            }
                            HStack(){
                                Text("$\(Int(item.beforeDiscountPrice))")
                                Text("$\(Int(item.price))")
                                    .foregroundColor(.red)
                                    .font(
                                        .system(size: 20)
                                        .weight(.bold)
                                        
                                    )
                                Text("/ 1pc")
                                    .foregroundColor(.gray)
                                Spacer()
                                
                            }
                            NavigationLink(destination: ProductDetailView(moveToNextView: false) .navigationBarHidden(true).edgesIgnoringSafeArea(.top)) {
                            Text("Add to Basket")
                                .padding(8)
                                .background(Color(red: 34/255, green: 139/255, blue: 34/255))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .font(.system(size: 16, weight: .semibold, design: .default))
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.90))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        
                        
                    }
                    
                    .cornerRadius(10)
                }
                .padding()
                
            }
        }
    }
    
    func favouriteButtonClicked(_ item: HomeItem) {
        if let index = favouriteItemData.favouriteItem.firstIndex(where: { $0.id == item.id }) {
            favouriteItemData.favouriteItem[index].isLiked.toggle()
        }
    }
}
struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
