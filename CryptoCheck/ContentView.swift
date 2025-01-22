//
//  ContentView.swift
//  CryptoCheck
//
//  Created by Anuj Jain on 22/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Red Color")
                    .foregroundStyle(Color.theme.red)
            }
        }
    }
}

#Preview {
    ContentView()
}
