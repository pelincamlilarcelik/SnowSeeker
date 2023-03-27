//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Onur Celik on 27.03.2023.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    @EnvironmentObject var favorites: Favorites
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    var body: some View {
        ScrollView{
            VStack(alignment:.leading,spacing: 0){
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                HStack{
                    if sizeClass == .compact && typeSize > .large{
                        VStack(spacing:10){ResortDetailsView(resort: resort)}
                        VStack(spacing:10){SkiDetailsView(resort: resort)}
                    }else{
                        ResortDetailsView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                    
                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))
                Group{
                    Text(resort.description)
                        .padding(.vertical)
                    Text("Facilities")
                        .font(.headline)
                    HStack{
                        ForEach(resort.facilityTypes){facility in
                            Button {
                                selectedFacility = facility
                                showingFacility = true
                            } label: {
                                //facility.icon
                                Image(systemName: "info.circle")
                                    }

                            
                        }
                    }
                    Button(favorites.contains(resort) ? "Remove from favorites" : "Add to favorites"){
                        if favorites.contains(resort) {
                            favorites.remove(resort)
                        }else{
                            favorites.add(resort)
                        }
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More Information", isPresented: $showingFacility, presenting: selectedFacility) { _ in
            
        }message: { facility in
            Text(facility.description)
        }
        
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ResortView(resort: Resort.example)
                .environmentObject(Favorites())
        }
    }
}
