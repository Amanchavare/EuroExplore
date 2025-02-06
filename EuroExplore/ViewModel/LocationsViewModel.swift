//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by Aman Niranjan Chavare on 14/01/25.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    //All loaded locations
    @Published var locations: [Location]
    
    // Current location on Map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationsList: Bool = false
    
    @Published var sheetLocation: Location? = nil
        
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
        
        loadNotes()
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(center: location.coordinates,
                                           span: mapSpan)
        }
    }
    
    func toggleLocationsList(){
        withAnimation(.easeInOut){
            showLocationsList.toggle()

        }
    }
    
    func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find current location")
            return
        }
        
        // Check if the nextIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT valid
            // Restart from 0
            guard let firstLocation = locations.first else{ return }
            showNextLocation(location: firstLocation)
            return
        }
        
        //Next Index is VALID
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
    // Function to load notes from UserDefaults
        func loadNotes() {
            for index in 0..<locations.count {
                if let savedNote = UserDefaults.standard.string(forKey: "note_\(locations[index].id)") {
                    locations[index].note = savedNote
                }
            }
        }
        
        // Function to save note for the current location to UserDefaults
        func saveNote() {
            if let index = locations.firstIndex(where: { $0 == mapLocation }) {
                UserDefaults.standard.set(mapLocation.note, forKey: "note_\(locations[index].id)")
            }
        }
}


