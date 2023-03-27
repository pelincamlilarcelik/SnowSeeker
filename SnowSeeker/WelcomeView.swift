//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Onur Celik on 27.03.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            Text("Please select to resort from the left-hand menu")
                .foregroundColor(.secondary)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
