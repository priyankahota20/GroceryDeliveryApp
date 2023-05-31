//
//  LoginBannerView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/25/23.
//

import SwiftUI

struct LoginBannerView: View {
    var body: some View {
        
        ZStack() {
            Image("logInBanner_img")
                .resizable()
            
            VStack (alignment: .leading, spacing: 10) {
                HStack(alignment: .top) {
                    Image("basket_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    
                    Text(AppConstants.loginSubHeaderStr)
                        .font(.system(size: 18))
                        .foregroundColor(Color.white)
                    Spacer()
                    
                }
                .padding(20)
                .offset(y: 30)
                
                
                Spacer()
                
                Text(AppConstants.loginHeaderDetailStr)
                    .font(.system(size: 27, weight: .heavy))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 20)
                    .foregroundColor(Color.white)
            }
            
        }
        .frame(minHeight: UIScreen.main.bounds.height / 4.5, maxHeight: .infinity, alignment: .center)
        .edgesIgnoringSafeArea(.top)
    }
}

struct LoginBannerView_Previews: PreviewProvider {
    static var previews: some View {
        LoginBannerView()
            .previewLayout(.sizeThatFits)
            .environment(\.colorScheme, .dark)
    }
}
