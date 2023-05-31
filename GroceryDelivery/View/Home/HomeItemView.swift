//
//  HomeItemView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import SwiftUI

struct HomeItemView: View {
    @State var navigateToProductDetails: Bool
    @Binding var item: HomeItem

    var body: some View {
        
        VStack(spacing: 5) {
            HStack{
                Button(action: {
                    item.isLiked.toggle()
                }) {
                    Image( item.isLiked ? "heart_check" : "heart_uncheck")
                }
                Spacer()
                
                if item.type == "sale" {
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
            }
            
            Image(item.imgName)
                .resizable()
                .frame(width: 130, height: 100)
            
            HStack{
                Text(item.name)
                Spacer()
            }
            HStack(){
                if item.type == "sale" {
                Text("$\(Int(item.beforeDiscountPrice))").strikethrough(true)
                }
                Text("$\(Int(item.price))")
                    .foregroundColor(.red)
                    .font(.system(size: 20, weight: .heavy, design: .default))
                Text("/ 1pc")
                    .foregroundColor(.gray)
                Spacer()
                
            }
            NavigationLink(destination: ProductDetailView( moveToNextView: false).navigationBarHidden(true), isActive: $navigateToProductDetails) { EmptyView() }
            
            Button(action: {
                self.navigateToProductDetails = true 
                
                
            }) {
                
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
        .frame(width: (UIScreen.main.bounds.width / 2) - 25, alignment: .leading)
    }
    
}
