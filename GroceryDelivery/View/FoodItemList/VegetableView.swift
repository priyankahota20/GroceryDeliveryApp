//
//  VegetableView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/30/23.
//

import SwiftUI


struct Vegetable: Identifiable {
    let id = UUID()
    let name: String
    let imgName: String
    var isLiked: Bool = false
    var price: Double
}

struct VegetableView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var backButton : some View { Button(action: {
           self.presentationMode.wrappedValue.dismiss()
          }) {
              HStack {
              Image(systemName: "arrow.backward")
                  .aspectRatio(contentMode: .fit)
                  .foregroundColor(.black)
              Text("Vegetables")
                      .font(.system(size: 20, weight: .heavy))
              }
          }
      }
    
    var body: some View {
        ZStack {
            VegetableItemView(pushToDetailsPage: false)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct VegetableItemView: View {
    
    @StateObject var vegetableItemData = HomeViewModel()
    @State private var vegetables = [
        Vegetable(name: "Cucumber", imgName: "ic_cucumber", price: 2.0),
        Vegetable(name: "Broccoli", imgName: "ic_banana", price: 4.0),
        Vegetable(name: "Peas", imgName: "ic_donut", price: 6.0),
        Vegetable(name: "Hokkdaido", imgName: "ic_chocolate", price: 8.0),
        Vegetable(name: "Orange", imgName: "ic_orange", price: 9.0),
        Vegetable(name: "Grapes", imgName: "ic_grapes", price: 15.0),
        Vegetable(name: "Watermelon", imgName: "ic_watermelon", price: 20),
    ]
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @State var pushToDetailsPage: Bool
    var body: some View {
      
            VStack {
                ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(vegetableItemData.vegetableItem) { veg in
                        VStack(spacing: 8) {
                            HStack{
                                Button(action: {
                                    toggleLikeVeg(veg)
                                }) {
                                    Image( veg.isLiked ? "heart_check" : "heart_uncheck")
                                                                             
                                }
                                Spacer()

                            }
                                
                            Image(veg.imgName)
                                    .resizable()
                                    .frame(width: 130, height: 100)
                            
                            HStack{
                                Text(veg.name)
                                Spacer()
                            }
                            HStack(){
                                Text("$\(Int(veg.beforeDiscountPrice))")
                                Text("$\(Int(veg.price))")
                                    .foregroundColor(.gray)
                                Spacer()
                                    
                            }
//                            NavigationLink(destination: GroceryDetailsView( areYouGoingToSecondView: false).navigationBarHidden(true), isActive: $pushToDetailsPage) { EmptyView() }

                            
                            Button(action: {
                                self.pushToDetailsPage = true
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
                       
                    }
                    
                    .cornerRadius(10)
                }
                .padding()
                
                }
            }
    }
    
    func addToCart(_ vegetable: HomeItem) {
        // Add your implementation here to add the grocery to the cart
        print("Added to cart: \(vegetable.name)")
     
        
    }
    
    func toggleLikeVeg(_ vegetable: HomeItem) {
        if let index = vegetableItemData.vegetableItem.firstIndex(where: { $0.id == vegetable.id }) {
            vegetableItemData.vegetableItem[index].isLiked.toggle()
        }
    }
}


struct VegetableView_Previews: PreviewProvider {
    static var previews: some View {
        VegetableView()
    }
}
