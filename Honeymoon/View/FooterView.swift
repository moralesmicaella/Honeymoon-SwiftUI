//
//  FooterView.swift
//  Honeymoon
//
//  Created by Micaella Morales on 3/15/22.
//

import SwiftUI

struct FooterView: View {
  
  // MARK: - PROPERTY
  
  @Binding var showBookingAlert: Bool
  
  private let haptics = UINotificationFeedbackGenerator()
  
  // MARK: - FUNCTION
  
  private func onBookButtonPressed() {
    playMP3Sound("sound-click")
    haptics.notificationOccurred(.success)
    showBookingAlert = true
  }
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
      Image(systemName: "xmark.circle")
        .font(.system(size: 42, weight: .light))
      
      Spacer()
      
      Button(action: onBookButtonPressed) {
        Text("BOOK DESTINATION")
          .font(.system(.subheadline, design: .rounded))
          .fontWeight(.heavy)
          .padding(.horizontal, 20)
          .padding(.vertical, 12)
          .foregroundColor(.pink)
          .background(
            Capsule()
              .stroke(Color.pink, lineWidth: 2)
          )
      }
      .buttonStyle(.plain)
      
      Spacer()
      
      Image(systemName: "heart.circle")
        .font(.system(size: 42, weight: .light))
    } //: HSTACK
    .padding()
  }
}

// MARK: - PREVIEW

struct FooterView_Previews: PreviewProvider {
  static var previews: some View {
    FooterView(showBookingAlert: .constant(false))
      .previewLayout(.fixed(width: 375, height: 80))
  }
}
