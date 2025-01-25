//
//  CryptoCheckApp.swift
//  CryptoCheck
//
//  Created by Anuj Jain on 22/01/25.
//

import SwiftUI

@main
struct CryptoCheckApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
