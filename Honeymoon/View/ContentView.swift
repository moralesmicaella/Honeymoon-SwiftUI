//
//  ContentView.swift
//  Honeymoon
//
//  Created by Micaella Morales on 3/15/22.
//

import SwiftUI

struct ContentView: View {
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      // MARK: - HEADER
      HeaderView()
      
      Spacer()
      
      CardView(honeymoon: honeymoonData[0])
        .padding()
      
      Spacer()
      
      // MARK: - FOOTER
      FooterView()
    }
  }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
