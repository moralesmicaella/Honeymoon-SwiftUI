//
//  Extensions.swift
//  Honeymoon
//
//  Created by Micaella Morales on 3/15/22.
//

import SwiftUI

extension Text {
  func titleModifier() -> some View {
    self
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundColor(.pink)
  }
  
  func buttonModifier() -> some View {
    self
      .font(.headline)
      .foregroundColor(.white)
      .padding()
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(
        Capsule()
          .fill(Color.pink)
      )
  }
}
