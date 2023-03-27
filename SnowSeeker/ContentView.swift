//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Onur Celik on 25.03.2023.
//

import SwiftUI

//extension View{
//    @ViewBuilder func phoneOnlyNavigationView()->some View{
//        if UIDevice.current.userInterfaceIdiom == .phone{
//            self.navigationViewStyle(.stack)
//        }else{
//            self
//        }
//    }
//}

struct ContentView: View {
    let resorts : [Resort] = Bundle.main.decode("resort.json")
    @State private var searchText = ""
    @StateObject var favorites = Favorites()
    var body: some View {
        NavigationView{
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack{
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width:40,height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay{
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.primary,lineWidth: 1)
                            }
                        VStack(alignment:.leading){
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        if favorites.contains(resort){
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .searchable(text: $searchText,prompt: "Search for a resort")
            
            .navigationTitle("Resorts")
            WelcomeView()

        }
        .environmentObject(favorites)
       // .phoneOnlyNavigationView()
    }
    var filteredResorts: [Resort]{
        if searchText.isEmpty{
            return resorts
        }else{
            return resorts.filter({$0.name.localizedCaseInsensitiveContains(searchText)})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
