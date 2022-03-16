//
//  ContentView.swift
//  Honeymoon
//
//  Created by Micaella Morales on 3/15/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      HeaderView()
      
      Spacer()
      
      CardView(honeymoon: honeymoonData[0])
        .padding()
      
      Spacer()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
