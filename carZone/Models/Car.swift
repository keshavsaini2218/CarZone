//
//  Car.swift
//  carZone
//
//  Created by KESHAV  on 20/03/26.
//

import Foundation

struct Car : Identifiable {
    
        var id = UUID()
    
        var name: String
        var brand: String
        var price: Double
    
        var year: Int
        var fuelType: String
        var transmission: String
        var kmDriven: Int
    
        var isSold: Bool
}
