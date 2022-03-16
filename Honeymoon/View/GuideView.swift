//
//  GuideView.swift
//  Honeymoon
//
//  Created by Micaella Morales on 3/15/22.
//

import SwiftUI

struct GuideView: View {
  
  // MARK: - FUNCTION
  
  func onContinueButtonPressed() {
    
  }
  
  // MARK: - BODY
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        HeaderComponent()
        
        Spacer(minLength: 10)
        
        Text("Get Started!")
          .font(.largeTitle)
          .fontWeight(.black)
          .foregroundColor(.pink)
        
        Text("Discover and pick the perfect destination for your romantic Honeymoon!")
          .multilineTextAlignment(.center)
        
        Spacer(minLength: 10)
        
        VStack(alignment: .leading, spacing: 25) {
          GuideComponent(
            title: "Like",
            subtitle: "Swipe right",
            description: "Do you like this destination? Touch the screen and swipe right. It will be savedto the favorites.",
            icon: "heart.circle"
          )
          
          GuideComponent(
            title: "Dismiss",
            subtitle: "Swipe left",
            description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
            icon: "xmark.circle"
          )
          
          GuideComponent(
            title: "Book",
            subtitle: "Tap the button",
            description: "Our selection of honeymoon resorts is the perfect setting for you to embark in your new life together",
            icon: "checkmark.square"
          )
        } //: VSTACK
        
        Spacer(minLength: 10)
        
        Button(action: onContinueButtonPressed) {
          Text("CONTINUE")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
              Capsule()
                .fill(Color.pink)
            )
        }
      } //: VSTACK
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding(.top, 15)
      .padding(.bottom, 25)
      .padding(.horizontal, 25)
    } //: SCROLL VIEW
  }
}

// MARK: - PREVIEW

struct GuideView_Previews: PreviewProvider {
  static var previews: some View {
    GuideView()
  }
}
