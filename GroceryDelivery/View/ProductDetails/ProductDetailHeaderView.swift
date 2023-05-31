//
//  ProductDetailHeaderView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/30/23.
//

import SwiftUI

struct ProductDetailHeaderView: View {
    
    @State private var isImageAnimated: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var isBackButtonPressed: Bool = false
    var backActionPerformed: (() -> Void)?
    var body: some View {
        ZStack {
          Image("apple")
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
            .padding(50)
            .scaleEffect(isImageAnimated ? 1.0 : 0.6)

            VStack(alignment: .leading, spacing: 20) {
                
                HStack(alignment: .center, spacing: 12) {
                    Image(systemName: "arrow.backward.circle.fill")
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .frame(width: 30, height: 30, alignment: .center)
                                       .foregroundColor(Color.gray)
                                       .onTapGesture(count: 1) {
                                           print("Tap")
                                           backActionPerformed?()
                                       }
                }
                
              
                HStack {
                    Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                                       .resizable()
                                       .aspectRatio(contentMode: .fill)
                                       .frame(width: 30, height: 30, alignment: .center)
                                       .foregroundColor(Color.gray)

                    Spacer()
                }
                HStack {
                    
                    Image(systemName: "heart.circle.fill")
                                       .resizable()
                                       .aspectRatio(contentMode: .fill)
                                       .frame(width: 30, height: 30, alignment: .center)
                                       .foregroundColor(Color.gray)
                                       .onTapGesture(count: 1) {
                                           print("Tap")
                                           backActionPerformed?()
                                       }

                    Spacer()
                }
                Spacer()
                

            }
            .padding(.vertical, 60)
            .padding(.horizontal, 20)
            
        }
        .frame(height: 350)
        .background(Color.gray.opacity(0.05))
        .onAppear() {
          withAnimation(.easeOut(duration: 0.5)) {
              isImageAnimated = true
          }
        }
    }
}

struct ProductDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailHeaderView()
    }
}
