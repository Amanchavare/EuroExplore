//
//  LocationsView.swift
//  SwiftfulMapApp
//
//  Created by Aman Niranjan Chavare on 14/01/25.
//

import SwiftUI
import MapKit
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
                 mapLayer
                .ignoresSafeArea()
            VStack{
                header
                    .padding()
                Spacer()
                locationPreviewStack
            }
            
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(locations: location)
        }
    }
}

extension LocationsView {
   
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                HStack {
                    Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(height: 55)
                        .lineLimit(1) // Ensures text doesn’t wrap
                        .truncationMode(.tail) // Adds "..." if text is too long

                    Spacer() // Pushes the arrow to the right

                    Image(systemName: "arrow.down")
                        .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.trailing, 10)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
            }

            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }

    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var locationPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                    .shadow(color: Color.black.opacity(0.3),radius: 10)
                    .padding()
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .trailing)))
                }
            }
        }
    }
    
    
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
