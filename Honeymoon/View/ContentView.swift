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
  
  private var cardViews: [CardView] = {
    var views = [CardView]()
    for index in 0..<2 {
      views.append(CardView(honeymoon: honeymoonData[index]))
    }
    return views
  }()
  
  // MARK: - FUNCTION
  
  private func isTopCard(_ cardView: CardView) -> Bool {
    guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
      return false
    }
    
    return index == 0
  }
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      // MARK: - HEADER
      HeaderView(showInfoView: $showInfo, showGuideView: $showGuide)
      
      Spacer()
      
      // MARK: - CARDS
      ZStack {
        ForEach(cardViews) { cardView in
          cardView
            .zIndex(isTopCard(cardView) ? 1 : 0)
        }
      } //: ZSTACK
      .padding(.horizontal)
      
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
