//
//  Reservation.swift
//  Julia_Flights
//
//  Created by Julia Prats on 2024-02-13.
//

struct Reservation {
    let customerName: String
    let passportNumber: String
    let flight: Flight
    let departureDate: String
    
    // booking number must be a computed property
    var bookingNumber: String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let bookingNumber = String((0..<5).map{ _ in letters.randomElement()! }) // max 5 characters long
        return bookingNumber
    }
}
