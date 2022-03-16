//
//  InfoView.swift
//  Honeymoon
//
//  Created by Micaella Morales on 3/15/22.
//

import SwiftUI

struct InfoView: View {
  
  // MARK: - PROPERTY
  
  @Environment(\.presentationMode) private var presentationMode
  
  // MARK: - FUNCTION
  
  func onContinueButtonPressed() {
    presentationMode.wrappedValue.dismiss()
  }
  
  // MARK: - BODY
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        HeaderComponent()
        
        Spacer(minLength: 10)
        
        // MARK: - APP INFO
        
        Text("App Info")
          .titleModifier()
        
        AppInfoView()
        
        // MARK: - CREDITS
        
        Text("Credits")
          .titleModifier()
        
        CreditsView() //: HSTACK
        
        Spacer(minLength: 10)
        
        Button(action: onContinueButtonPressed) {
          Text("CONTINUE")
            .buttonModifier()
        }
        .buttonStyle(.plain)
      } //: VSTACK
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding(.top, 15)
      .padding(.bottom, 25)
      .padding(.horizontal, 25)
    } //: SCROLL VIEW
  }
}

// MARK: - PREVIEW

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}

// MARK: - APP INFO VIEW

struct AppInfoView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      RowAppInfoView(item1: "Application", item2: "Honeymoon")
      RowAppInfoView(item1: "Compatibility", item2: "iPhone and iPad")
      RowAppInfoView(item1: "Developer", item2: "Micaella Morales")
      RowAppInfoView(item1: "Designer", item2: "Robert Petras")
      RowAppInfoView(item1: "Website", item2: "swiftuimasterclass.com")
      RowAppInfoView(item1: "Version", item2: "1.0.0")
    } //: VSTACK
  }
}

// MARK: - ROW APP INFO VIEW

struct RowAppInfoView: View {
  
  // MARK: - PROPERTY
  
  var item1: String
  var item2: String
  
  var body: some View {
    VStack {
      HStack {
        Text(item1)
          .foregroundColor(.gray)
        Spacer()
        Text(item2)
      } //: HSTACK
      
      Divider()
    } //: VSTACK
  }
}

// MARK: - CREDITS VIEW

struct CreditsView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Text("Photos")
          .foregroundColor(.gray)
        Spacer()
        Text("Unsplash")
      } //: HSTACK
      
      Divider()
      
      Text("Photographers")
        .foregroundColor(.gray)
      
      Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
        .multilineTextAlignment(.leading)
        .font(.footnote)
    } //: VSTACK
  }
}
