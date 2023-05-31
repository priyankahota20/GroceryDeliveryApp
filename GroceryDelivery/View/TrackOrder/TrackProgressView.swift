//
//  TrackProgressView.swift
//  GroceryDelivery
//
//  Created by Capgemini-DA184 on 5/29/23.
//

import SwiftUI

struct TrackProgressView: View {
    
    var orderTrackStatus: String
    var orderStatusDetail: String
    var dateStr: String
    var isLast: Bool
    var isActive: Bool
    
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(spacing: 0) {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(self.isActive ? Color.blue.opacity(0.8) : Color.gray.opacity(0.6))
                    if (isActive) {
                        Image("right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    }
                }
                if (!isLast) {
                Rectangle()
                    .frame(width: 4, height: 100)
                    .foregroundColor(Color.gray.opacity(0.2))
                }

            }
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(orderTrackStatus)
                    .frame(width: 200, alignment: .leading)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.black)
        
                VStack(alignment: .leading) {
                Text(orderStatusDetail)
                    .frame(width: 200, alignment: .leading)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color.secondary)
                    .multilineTextAlignment(.leading)
                
                Text(dateStr)
                    .frame(width: 200, alignment: .leading)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color.secondary)
                }

            }
        }
    }
}

struct TrackProgressView_Previews: PreviewProvider {
    static var previews: some View {
        TrackProgressView(orderTrackStatus: "Order Placed", orderStatusDetail:"Your order #2244 was placed.", dateStr: "22 August, 2022, 10:15 A.M", isLast: false, isActive: true)
    }
}
