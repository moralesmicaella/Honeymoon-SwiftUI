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
  @State private var lastCardIndex: Int = 1
  @State private var cardViews: [CardView] = {
    var views = [CardView]()
    for index in 0..<2 {
      views.append(CardView(honeymoon: honeymoonData[index]))
    }
    return views
  }()
  
  @GestureState private var dragState = DragState.inactive
  
  private let dragAreaThreshold: CGFloat = 65.0
    
  // MARK: - FUNCTION
  
  private func isTopCard(_ cardView: CardView) -> Bool {
    guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
      return false
    }
    
    return index == 0
  }
  
  private func moveCards() {
    cardViews.removeFirst()
    lastCardIndex += 1
    
    let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
    let newCardView = CardView(honeymoon: honeymoon)
    cardViews.append(newCardView)
  }
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      // MARK: - HEADER
      HeaderView(showInfoView: $showInfo, showGuideView: $showGuide)
        .opacity(dragState.isDragging ? 0 : 1)
        .animation(.default, value: dragState.isDragging)
      
      Spacer()
      
      // MARK: - CARDS
      ZStack {
        ForEach(cardViews) { cardView in
          cardView
            .zIndex(isTopCard(cardView) ? 1 : 0)
            .overlay(alignment: .center) {
              ZStack {
                Image(systemName: "x.circle")
                  .symbolModifier()
                  .opacity((isTopCard(cardView) && dragState.translation.width < -dragAreaThreshold) ? 1 : 0)
                
                Image(systemName: "heart.circle")
                  .symbolModifier()
                  .opacity((isTopCard(cardView) && dragState.translation.width > dragAreaThreshold) ? 1 : 0)
              }
            }
            .offset(x: isTopCard(cardView) ? dragState.translation.width : 0, y: isTopCard(cardView) ? dragState.translation.height : 0)
            .scaleEffect((isTopCard(cardView) && dragState.isDragging) ? 0.75 : 1.0)
            .rotationEffect(Angle(degrees: isTopCard(cardView) ? Double(dragState.translation.width / 12) : 0))
            .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.isDragging)
            .gesture(
              LongPressGesture(minimumDuration: 0.01)
                .sequenced(before: DragGesture())
                .updating($dragState, body: { value, state, transaction in
                  switch value {
                  case .first(true):
                    state = .pressing
                  case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                  default:
                    break
                  }
                })
                .onEnded({ value in
                  guard case .second(true, let drag?) = value else {
                    return
                  }
                  
                  if drag.translation.width < -dragAreaThreshold || drag.translation.width > dragAreaThreshold {
                    moveCards()
                  }
                })
            )
        }
      } //: ZSTACK
      .padding(.horizontal)
      
      Spacer()
      
      // MARK: - FOOTER
      FooterView(showBookingAlert: $showAlert)
        .opacity(dragState.isDragging ? 0 : 1)
        .animation(.default, value: dragState.isDragging)
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

// MARK: - DRAG STATES

fileprivate enum DragState {
  case inactive
  case pressing
  case dragging(translation: CGSize)
  
  var translation: CGSize {
    switch self {
    case .inactive, .pressing:
      return .zero
    case .dragging(let translation):
      return translation
    }
  }
  
  var isDragging: Bool {
    switch self {
    case .dragging:
      return true
    case .inactive, .pressing:
      return false
    }
  }
  
  var isPressing: Bool {
    switch self {
    case .pressing, .dragging:
      return true
    case .inactive:
      return false
    }
  }
}
