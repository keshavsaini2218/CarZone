import SwiftUI

struct CarListView: View {
    
    @StateObject var viewModel = CarViewModel()
    @State private var searchText: String = ""
    @State private var selectedFilter: CarFilter = .all
    
    enum CarFilter {
        case all
        case available
        case sold
    }
    
    // 🔹 Filter Logic
    var filteredCars: [Car] {
        let searchedCars = searchText.isEmpty ? viewModel.cars : viewModel.cars.filter {
            $0.name.lowercased().contains(searchText.lowercased()) ||
            $0.brand.lowercased().contains(searchText.lowercased())
        }
        
        switch selectedFilter {
        case .all:
            return searchedCars
        case .available:
            return searchedCars.filter { !$0.isSold }
        case .sold:
            return searchedCars.filter { $0.isSold }
        }
    }
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 10) {
                
                //Header
                ZStack {
                    // Center Title
                    Text("Inventory")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    // Right Side Button
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: AddCarView(viewModel: viewModel)) {
                            ZStack {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 36, height: 36)
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                Divider()
                    .padding(.top, 8)
                  
                //search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search cars", text: $searchText)
                        .autocorrectionDisabled()
                    
                    if !searchText.isEmpty {
                        Button {
                            searchText = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(12)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
                .padding(.horizontal)
                
                // 🔹 Filter
                Picker("Filter", selection: $selectedFilter) {
                    Text("All").tag(CarFilter.all)
                    Text("Available").tag(CarFilter.available)
                    Text("Sold").tag(CarFilter.sold)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                // 🔹 List
                List(filteredCars) { car in
                    ZStack {
                        CarCardView(car: car)
                        
                        NavigationLink(
                            destination: CarDetailView(car: car, viewModel: viewModel)
                        ) {
                            EmptyView()
                        }
                        .opacity(0)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.plain)
                .searchable(text: $searchText, prompt: "Search cars")
            }
            .background(Color(.systemGroupedBackground))
            .toolbar(.hidden, for: .navigationBar)
        }
        
    }
}

#Preview {
    CarListView()
}
