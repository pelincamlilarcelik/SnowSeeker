//
//  FileManager-DocumentDirectory.swift
//  SnowSeeker
//
//  Created by Onur Celik on 27.03.2023.
//

import Foundation
extension FileManager{
    static var documentDirectory: URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
