//
//  EuroExploreApp.swift
//  EuroExplore
//
//  Created by Aman Niranjan Chavare on 07/02/25.
//

import SwiftUI

@main
struct EuroExploreApp: App {
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
