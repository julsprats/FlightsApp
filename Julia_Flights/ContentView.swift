//
//  ContentView.swift
//  Julia_Flights
//
//  Created by Julia Prats on 2024-02-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FlightReservationForm()
                .tabItem {
                    Label("Add Reservation", systemImage: "plus")
                }
            ReservationHistoryScreen()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
