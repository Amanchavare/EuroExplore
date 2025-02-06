//
//  LocationDetailView.swift
//  SwiftfulMapApp
//
//  Created by Aman Niranjan Chavare on 18/01/25.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject var vm: LocationsViewModel
    let locations: Location
    @State private var note: String = ""
    @StateObject private var keyboardResponder = KeyboardResponder() // Declare it here

    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20,x: 0,y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    description
                    Divider()
                    noteSection
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            }
        }
        .padding(.bottom, keyboardResponder.keyboardHeight)
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topLeading)
        .onAppear {
            loadNote()
        }
    }
    // Function to load the note when the view appears
        private func loadNote() {
            if let savedNote = UserDefaults.standard.string(forKey: "note_\(locations.id)") {
                note = savedNote
            }
        }

        // Save note when the user types
        private func saveNote() {
            UserDefaults.standard.set(note, forKey: "note_\(locations.id)")
        }
}

#Preview {
    LocationDetailView(locations: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(locations.imageNames, id: \.self) { location in
                Image(location)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
   
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8){
            Text (locations.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text (locations.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
    }
    private var description: some View {
        VStack(alignment: .leading, spacing: 8){
            Text (locations.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: locations.link){
                Link("Read More on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
        
    }
    
    private var noteSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Memories from this Place")
                .font(.headline)
                .foregroundColor(.primary)
            
            ZStack(alignment: .topLeading) {
                if note.isEmpty {
                    Text("Write something about this place...")
                        .foregroundColor(.gray)
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        .allowsHitTesting(false) // Ensures placeholder doesn't block TextEditor taps
                }
                TextEditor(text: $note)
                    .frame(minHeight: 120, maxHeight: 150)
                    .padding(.horizontal, 12)
                    .padding(.top, 8)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .onChange(of: note) { _ in
                        saveNote()
                    }
            }
        }
        .padding()
       
    }
    
    private var backButton: some View {
        Button(action: {
            vm.sheetLocation = nil
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        })
        
    }
    
}
