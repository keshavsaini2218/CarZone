//
//  CarDetailView.swift
//  carZone
//
//  Created by KESHAV  on 20/03/26.
//

import SwiftUI

struct CarDetailView: View {
    var car : Car
    @ObservedObject var viewModel: CarViewModel
    
    @Environment(\.dismiss) var dismiss
    @State private var showDeleteAlert = false
    
    var body: some View {
        ScrollView{
            
            VStack(spacing: 20) {
                
                
                ZStack(alignment: .topTrailing)
                {
                    // Image placeholder
                    ZStack(){
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 220)
                            .cornerRadius(16)
                        
                        Image(systemName: "car.fill")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    }
                    Text(car.isSold ? "SOLD" : "AVAILABLE")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(
                            car.isSold ? Color.red.opacity(0.2) : Color.green.opacity(0.2)
                        )
                        .foregroundColor(car.isSold ? .red : .green)
                        .clipShape(Capsule())
                        .padding(10)
                }
                .padding(.horizontal)
                
                
                // Car details
                VStack(alignment: .leading, spacing: 12) {
                                   
                                   Text(car.name)
                                       .font(.title2)
                                       .fontWeight(.bold)
                                   
                                   Text(car.brand)
                                       .foregroundColor(.secondary)
                                   
                                   Divider()
                                   
                        Text("Price: ₹\(Int(car.price))")
                        
                        Text("Year: \(car.year)")
                        
                        Text("Fuel Type: \(car.fuelType)")
                        
                        Text("Transmission: \(car.transmission)")
                        
                        Text("KM Driven: \(car.kmDriven)")
                        
                        Text("Status: \(car.isSold ? "Sold" : "Available")")
                                   
                               }
                               .padding()
                               .background(Color.white)
                               .cornerRadius(16)
                               .shadow(color: .black.opacity(0.05), radius: 5)
                               .padding(.horizontal)
                
                VStack(spacing : 12)
                {
                    Button {
                        viewModel.toggleSoldStatus(for: car)
                        dismiss()
                    } label: {
                        Text(car.isSold ? "Mark as Available" : "Mark as Sold")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(car.isSold ? Color.green : Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    
                    // Delete
                    Button {
                        showDeleteAlert = true
                    } label: {
                        Text("Delete Car")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.15))
                            .foregroundColor(.red)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
            .padding(.top)
        }
        .background(Color(.systemGroupedBackground))
                .alert("Delete Car?", isPresented: $showDeleteAlert) {
                    Button("Delete", role: .destructive) {
                        viewModel.deleteCar(car)
                        dismiss()
                    }
                    Button("Cancel", role: .cancel) { }
                }
            
        }
    
}
#Preview {
    CarDetailView(car : Car(name: "City", brand: "Honda", price: 1000000, year: 2013, fuelType: "Petrol", transmission: "Automatic",kmDriven: 20000 ,isSold: true), viewModel: CarViewModel())
}
