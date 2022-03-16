//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Micaella Morales on 3/15/22.
//

import SwiftUI

struct HeaderView: View {
  
  // MARK: - FUNCTION
  func infoButtonPressed() {
    
  }
  
  func questionButtonPressed() {
    
  }
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
      Button(action: infoButtonPressed) {
        Image(systemName: "info.circle")
          .font(.system(size: 24, weight: .regular))
          .foregroundColor(.primary)
      }
      .buttonStyle(.plain)
      
      Spacer()
      
      Image("logo-honeymoon-pink")
        .resizable()
        .scaledToFit()
        .frame(height: 28)
      
      Spacer()
      
      Button(action: questionButtonPressed) {
        Image(systemName: "questionmark.circle")
          .font(.system(size: 24, weight: .regular))
          .foregroundColor(.primary)
      }
      .buttonStyle(.plain)

    } //: HSTACK
    .padding()
  }
}

// MARK: - PREVIEW

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView()
      .previewLayout(.fixed(width: 375, height: 80))
  }
}
