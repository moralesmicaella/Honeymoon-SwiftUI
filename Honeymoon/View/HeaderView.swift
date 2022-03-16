//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Micaella Morales on 3/15/22.
//

import SwiftUI

struct HeaderView: View {
  
  // MARK: - PROPERTY
  
  @Binding var showInfoView: Bool
  @Binding var showGuideView: Bool
  
  // MARK: - FUNCTION
  
  private func onInfoButtonPressed() {
    showInfoView = true
  }
  
  private func onQuestionButtonPressed() {
    showGuideView = true
  }
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
      Button(action: onInfoButtonPressed) {
        Image(systemName: "info.circle")
          .font(.system(size: 24, weight: .regular))
          .foregroundColor(.primary)
      }
      .buttonStyle(.plain)
      .sheet(isPresented: $showInfoView) {
        InfoView()
      }
      
      Spacer()
      
      Image("logo-honeymoon-pink")
        .resizable()
        .scaledToFit()
        .frame(height: 28)
      
      Spacer()
      
      Button(action: onQuestionButtonPressed) {
        Image(systemName: "questionmark.circle")
          .font(.system(size: 24, weight: .regular))
          .foregroundColor(.primary)
      }
      .buttonStyle(.plain)
      .sheet(isPresented: $showGuideView) {
        GuideView()
      }

    } //: HSTACK
    .padding()
  }
}

// MARK: - PREVIEW

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(showInfoView: .constant(false), showGuideView: .constant(false))
      .previewLayout(.fixed(width: 375, height: 80))
  }
}
