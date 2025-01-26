//
//  Julia_FlightsApp.swift
//  Julia_Flights
//
//  Created by Julia Prats on 2024-02-13.
//

import SwiftUI

@main
struct Julia_FlightsApp: App {
    @StateObject var reservationViewModel = ReservationViewModel() // shared ViewModel
        
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environmentObject(reservationViewModel)
            }
        }
    }
