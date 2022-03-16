//
//  HoneymoonModel.swift
//  Honeymoon
//
//  Created by Micaella Morales on 3/15/22.
//

import Foundation

struct Destination: Identifiable {
  let id = UUID()
  let place: String
  let country: String
  let image: String
}
