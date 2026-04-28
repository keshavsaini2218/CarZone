//
//  CarViewModel.swift
//  carZone
//
//  Created by KESHAV  on 20/03/26.
//

import Foundation

class CarViewModel: ObservableObject {
    
    @Published var cars: [Car] = [
        Car(name: "City", brand: "Honda", price: 1000000, year: 2013, fuelType: "Petrol", transmission: "Automatic",kmDriven: 20000 ,isSold: true),
        Car(name: "City", brand: "Honda", price: 1000000, year: 2013, fuelType: "Petrol", transmission: "Automatic",kmDriven: 20000 ,isSold: true),
    ]
    
    func addCar(name: String,
                brand: String,
                price: Double,
                year: Int,
                fuelType: String,
                transmission: String,
                kmDriven: Int) {
        let newCar = Car(
                name: name,
                brand: brand,
                price: price,
                year: year,
                fuelType: fuelType,
                transmission: transmission,
                kmDriven: kmDriven,
                isSold: false
            )
        cars.append(newCar)
    }
    
    func toggleSoldStatus(for car: Car) {
        if let index = cars.firstIndex(where: { $0.id == car.id }) {
            cars[index].isSold.toggle()
        }
    }
    
    func deleteCar(_ car: Car) {
        cars.removeAll { $0.id == car.id }
    }
    
    
}
