//
//  CarCardView.swift
//  carZone
//
//  Created by KESHAV  on 20/03/26.
//

import SwiftUI

struct CarCardView: View {
    var car : Car
    var body: some View {
                HStack(spacing: 12) {
                    
                    // 🔹 Image Placeholder
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 90, height: 90)
                        
                        Image(systemName: "car.fill")
                                           .font(.title)
                                           .foregroundColor(.gray)
                    }
                    
                    
                    // 🔹 Car Details
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text(car.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(car.brand)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("₹\(Int(car.price))")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    // 🔹 Status Badge
                    Text(car.isSold ? "SOLD" : "AVAILABLE")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(car.isSold ? Color.red.opacity(0.2) : Color.green.opacity(0.2))
                        .foregroundColor(car.isSold ? .red : .green)
                        .clipShape(Capsule())
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(16)
                .shadow(color : Color.black.opacity(0.5) ,radius: 4, x : 0 , y : 2)
                .padding(.horizontal)
                .padding(.vertical , 4)
            }
        }

#Preview {
    CarCardView(car :  Car(name: "City", brand: "Honda", price: 1000000, year: 2013, fuelType: "Petrol", transmission: "Automatic",kmDriven: 20000 ,isSold: true))
}
