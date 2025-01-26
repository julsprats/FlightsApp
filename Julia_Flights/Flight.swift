//
//  Flight.swift
//  Julia_Flights
//
//  Created by Julia Prats on 2024-02-13.
//

import Foundation

struct Flight {
    let flightNumber: String
    let departureCity: String
    let arrivalCity: String
    let distance: Double
    let airlineCarrier: String
    
    // price computed property --> $100 + (Flight Distance * $0.12)
    var price: Double {
        return 100 + (distance * 0.12)
    }
}
