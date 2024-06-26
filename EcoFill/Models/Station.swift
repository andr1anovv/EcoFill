//
//  Station.swift
//  EcoFill
//
//  Created by Alexander Andrianov on 06.02.2024.
//

import Foundation
import MapKit

struct Station: Decodable, Identifiable, Hashable {
  var id: String
  var city: String
  var euroA95: Double
  var euroDP: Double
  var gas: Double
  var latitude: Double
  var longitude: Double
  var name: String
  var postalCode: String
  var schedule: String
  var street: String
  
  var address: String {
    return "\(city), \(street), \(postalCode)"
  }
  
  var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}

extension Station {
  static var testStation = Station(id: "test",
                                   city: "Kyiv",
                                   euroA95: 53.99,
                                   euroDP: 54.99,
                                   gas: 24.99,
                                   latitude: 50.447306,
                                   longitude: 30.494783,
                                   name: "EcoFill",
                                   postalCode: "02000",
                                   schedule: "08:00-23.00",
                                   street: "Olesia Honchara St, 79-75")
}

