//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Onur Celik on 27.03.2023.
//

import Foundation
class Favorites: ObservableObject{
    private var resorts: [Resort]
    private let saveKey = "Favorites"
    
    let savedPath = FileManager.documentDirectory.appending(path: "SavedPath")
    
    init(){
        do{
            let data = try Data(contentsOf: savedPath)
            resorts = try JSONDecoder().decode([Resort].self, from: data)
        }catch{
            resorts = [Resort]()
            print("error")
        }
    }
    func contains(_ resort: Resort)->Bool{
        resorts.contains(resort)
    }
    func add(_ resort: Resort){
        objectWillChange.send()
        resorts.append(resort)
        save()
    }
    func remove(_ resort:Resort){
        objectWillChange.send()
        if let index = resorts.firstIndex(of: resort){
            resorts.remove(at: index)
        }
        save()
    }
    func save(){
        // write out our data
        do{
            let data = try JSONEncoder().encode(resorts)
            try data.write(to: savedPath,options: [.atomic,.completeFileProtection])
        }catch{
           print("Unable to save data")
        }
    }
}
