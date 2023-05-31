//
//  CartView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import SwiftUI

struct CartView: View {
    @StateObject var cartData = CartItemViewModel()
    @Binding var tabSelection: Int
    @State var navigateToOrderTrackDetails: Bool
    @Environment(\.dismiss) var dismiss
    @State var isComingFromDetailsPage: Bool

    var body: some View {
        VStack() {
            Spacer(minLength: 20)
            HStack(spacing: 15) {
                if isComingFromDetailsPage {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 26, weight: .heavy))
                            .foregroundColor(.black)
                    }
                }
               Text("Your Basket")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                   
               Spacer()
            }
            .padding(.leading, 20)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 15) {
                    ForEach(cartData.items){item in
                        
                        CartItemView(item: $cartData.items[getIndex(item: item)])
                        
                    }
                }
            }
            
            ZStack {
                
                VStack(spacing: 10) {
                    
                    HStack {
                        Text("Subtotal")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(Color.black)
                        Spacer(minLength: 0)
                        Text(getPrice(value: calculateSubTotalPrice()))
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 10)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    HStack {
                        Text("Delivery")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(Color.black)
                        Spacer(minLength: 0)
                        Text("$1.00")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    
                    VStack {
                        Divider()
                    HStack {
                        Text("Total")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color.black)
                        Spacer(minLength: 0)
                        Text(getPrice(value:calculateTotal()))
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                    }
                    }
                    .padding(.all, 20)

                  

                    NavigationLink(destination: TrackOrderDetails(tabSelection: $tabSelection).navigationBarHidden(true), isActive: $navigateToOrderTrackDetails) { }
                    Button {
                        self.navigateToOrderTrackDetails = true
                    } label: {
                        Text("Order now")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color.init(red: 2.0/255.0, green: 152.0/255.0, blue: 80.0/255.0))
                            .cornerRadius(15)
                            .padding([.bottom], 20)
                    }
                }
                
                .background(Color.white
                    .clipShape(CustomCorners(cornors: [.topLeft, .topRight], radius: 15))
                    .shadow(color: Color.gray.opacity(0.3), radius: 4.0, x: 0, y: 0)
                    .mask(Rectangle().padding(.top, -20))
                            
                    )
                }

            }

    }
    func getIndex(item: CartItem) -> Int{
        return cartData.items.firstIndex {(item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    func calculateSubTotalPrice() -> Float {
        var price: Float = 0
        
        cartData.items.forEach { item in
            if(item.unit != "") {
                if item.quantity == 50 {
                    price += Float(item.price)
                } else if(item.quantity > 50) {
                    price += 0.64 * Float((item.quantity - 50))
                } else {
                    price += 0.64 * Float((50 - item.quantity))
                }
                
            } else {
                price += Float(item.quantity) * Float(item.price)
            }
        }
        
        return price
    }
    
    func calculateTotal() -> Float {
        var price: Float = 0
        price = calculateSubTotalPrice()
        
        price += 1.00
        
        return price
    }
    
    func getPrice(value: Float) -> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        return format.string(from: NSNumber(value: value)) ?? ""
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(tabSelection: .constant(1), navigateToOrderTrackDetails: false, isComingFromDetailsPage: false)
    }
}

struct CustomCorners: Shape {
    var cornors: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: cornors, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
