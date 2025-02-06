//
//  Location.swift
//  SwiftfulMapApp
//
//  Created by Aman Niranjan Chavare on 14/01/25.
//

import Foundation
import MapKit

struct Location:Identifiable, Equatable {
    
    let name: String
    let cityName: String
    let coordinates:CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
        
    var userImages: [UIImage] = [] // User-added images
    
    var note: String?
    
    var id: String {
        name + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}


