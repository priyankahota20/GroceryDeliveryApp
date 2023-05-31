//
//  ProductDetailView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/30/23.
//

import SwiftUI

struct ProductDetailView: View {
    @State var itemCounter: Int = 1
    @Environment(\.dismiss) var dismiss
    @State var moveToNextView: Bool
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack() {
                
                ProductDetailHeaderView()
                {
                    dismiss()
                }
                VStack{
                    HStack{
                        Text("Apple")
                            .font(.title2)
                            .foregroundColor(Color.black)
                        
                        Spacer()
                        
                        Text("-10%")
                            .foregroundColor(Color.white)
                            .frame(height: 25)
                            .frame(maxWidth: 70)
                            .background(
                                RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.init(red: 218.0/255.0, green: 32.0/255.0, blue: 32.0/255))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 50, style: .continuous)
                                    .strokeBorder(Color.init(red: 218.0/255.0, green: 32.0/255.0, blue: 32.0/255), lineWidth: 1)
                            )
                    }
                    .padding(20)
                    
                    HStack {
                        
                        Group {
                            Text("$2 ")
                                .foregroundColor(Color.init(red: 218.0/255.0, green: 32.0/255.0, blue: 32.0/255))
                                .fontWeight(.semibold)
                                .font(.system(size: 20)) +
                            Text("/ 1pc ")
                                .foregroundColor(Color.gray)
                                .fontWeight(.none)
                        }
                        .padding(.horizontal, 20)
                        .offset(x: 0, y: -10)
                        Spacer()
                    }
                    
                    HStack {
                        Text(AppConstants.productDetailStr)
                            .font(.headline)
                            .foregroundColor(Color.gray)
                            .lineLimit(nil)
                    }.padding()
                }
                
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 0){
                            Text("2pcs x $2")
                                .foregroundColor(Color.gray)
                            Spacer()
                            Text("$4.00")
                                .foregroundColor(Color.black)
                                .fontWeight(.semibold)
                                .font(.system(size: 22))
                            
                        }
                        Spacer()
                        HStack( spacing: 0) {
                            Button(action: {
                                if itemCounter > 1 {
                                    itemCounter -= 1
                                } else {
                                    print("Negative")
                                }
                            }, label: {
                                ZStack {
                                    
                                    Image(systemName: "minus")
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                }
                            })
                            
                            .padding(.vertical, 10)
                            
                            Text(String(itemCounter))
                                .padding(30)
                                .font(.system(size: 28, weight: .bold, design: .monospaced))
                            
                            Button(action: {
                                itemCounter += 1
                            }, label: {
                                ZStack {
                                    Image(systemName: "plus")
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                }
                            })
                        }
                        
                        .frame(width: 120, height: 35)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .strokeBorder(Color.gray, lineWidth: 1)
                        )
                    }
                    .padding(20)
                    Spacer(minLength: 40)
                    
                    
                    NavigationLink(destination: CartView(tabSelection: .constant(1), navigateToOrderTrackDetails: false, isComingFromDetailsPage: true).navigationBarHidden(true), isActive: $moveToNextView) { EmptyView() }
                    
                    Button(action: {
                        self.moveToNextView = true
                        
                    }) {
                        Text("Add to basket")
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                            .background(Color.init(red: 2.0/255.0, green: 152.0/255.0, blue: 80.0/255.0))
                            .cornerRadius(10)
                            .padding()
                    }
                }
                .background(Color.white
                    .clipShape(CustomCorners(cornors: [.topLeft, .topRight], radius: 15))
                    .shadow(color: Color.gray.opacity(0.3), radius: 4.0, x: 0, y: 0)
                    .mask(Rectangle().padding(.top, -20))
                            
                )
            }
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(moveToNextView: false)
    }
}
