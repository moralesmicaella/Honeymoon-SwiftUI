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

extension Image {
  func symbolModifier() -> some View {
    self
      .foregroundColor(.white)
      .font(.system(size: 128))
      .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 0)
  }
}

extension AnyTransition {
  static var trailingBottom: AnyTransition {
    AnyTransition.asymmetric(
      insertion: .identity,
      removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
  }
  
  static var leadingBottom: AnyTransition {
    AnyTransition.asymmetric(
      insertion: .identity,
      removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
  }
}
