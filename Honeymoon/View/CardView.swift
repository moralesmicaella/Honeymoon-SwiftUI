//
//  CardView.swift
//  Honeymoon
//
//  Created by Micaella Morales on 3/15/22.
//

import SwiftUI

struct CardView: View {
  // MARK: - PROPERTY
  
  let honeymoon: Destination
  
  // MARK: - BODY
  
  var body: some View {
    Image(honeymoon.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(24)
      .frame(minWidth: 0, maxWidth: .infinity)
      .overlay(alignment: .bottom) {
        VStack(alignment: .center, spacing: 12) {
          Text(honeymoon.place.uppercased())
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(radius: 1)
            .padding(.horizontal, 18)
            .padding(.bottom, 4)
            .overlay(alignment: .bottom) {
              Rectangle()
                .fill(Color.white)
                .frame(height: 1)
            }
          Text(honeymoon.country.uppercased())
            .foregroundColor(.black)
            .font(.footnote)
            .fontWeight(.bold)
            .frame(minWidth: 85)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
              Capsule()
                .fill(Color.white)
            )
        } //: VSTACK
        .frame(minWidth: 280)
        .padding(.bottom, 50)
      }
  }
}

// MARK: - PREVIEW

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(honeymoon: honeymoonData[0])
      .previewLayout(.fixed(width: 376, height: 600))
  }
}
