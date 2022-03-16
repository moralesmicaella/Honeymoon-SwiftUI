//
//  ContentView.swift
//  Honeymoon
//
//  Created by Micaella Morales on 3/15/22.
//

import SwiftUI

struct ContentView: View {
  
  // MARK: - PROPERTY
  
  @State private var showAlert: Bool = false
  @State private var showInfo: Bool = false
  @State private var showGuide: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      // MARK: - HEADER
      HeaderView(showInfoView: $showInfo, showGuideView: $showGuide)
      
      Spacer()
      
      CardView(honeymoon: honeymoonData[0])
        .padding()
      
      Spacer()
      
      // MARK: - FOOTER
      FooterView(showBookingAlert: $showAlert)
    } //: VSTACK
    .alert("SUCCESS", isPresented: $showAlert) {
      Button("Happy Honeymoon!", role: .cancel) { }
      .buttonStyle(.plain)
    } message: {
      Text("Wishing a lovely and most precious of the times together for the amazing couple.")
    }
    
  }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
