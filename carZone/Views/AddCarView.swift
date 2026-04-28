//
//  AddCarView.swift
//  carZone
//
//  Created by KESHAV  on 20/03/26.
//

import SwiftUI

struct AddCarView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: CarViewModel
    // 🔹 Form State (temporary storage)
    @State private var name: String = ""
    @State private var brand: String = ""
    @State private var price: String = ""
    @State private var year: String = ""
    @State private var kmDriven: String = ""
    
    @State private var fuelType: String = "Petrol"
    @State private var transmission: String = "Manual"
    
    let fuelOptions = ["Petrol", "Diesel", "CNG", "Electric"]
    let transmissionOptions = ["Manual", "Automatic"]
    
    var body: some View {
        NavigationStack {
            Form {
                
                // 🔹 Basic Info
                Section(header: Text("Basic Info")) {
                    TextField("Car Name", text: $name)
                    TextField("Brand", text: $brand)
                    TextField("Price", text: $price)
                        .keyboardType(.numberPad)
                    TextField("Year", text: $year)
                        .keyboardType(.numberPad)
                }
                
                // 🔹 Specifications
                Section(header: Text("Specifications")) {
                    
                    Picker("Fuel Type", selection: $fuelType) {
                        ForEach(fuelOptions, id: \.self) { fuel in
                            Text(fuel)
                        }
                    }
                    
                    Picker("Transmission", selection: $transmission) {
                        ForEach(transmissionOptions, id: \.self) { type in
                            Text(type)
                        }
                    }
                    
                    TextField("KM Driven", text: $kmDriven)
                        .keyboardType(.numberPad)
                }
                
                // 🔹 Save Button
                Section {
                    Button("Save Car") {
                        viewModel.addCar(
                               name: name,
                               brand: brand,
                               price: Double(price) ?? 0,
                               year: Int(year) ?? 0,
                               fuelType: fuelType,
                               transmission: transmission,
                               kmDriven: Int(kmDriven) ?? 0
                           )
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Car")
        }
    }
}

#Preview {
    AddCarView(viewModel:CarViewModel())
}
