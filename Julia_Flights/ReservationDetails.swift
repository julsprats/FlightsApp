//
//  ReservationDetails.swift
//  Julia_Flights
//
//  Created by Julia Prats on 2024-02-13.
//
import SwiftUI

struct ReservationDetails: View {
    let reservation: Reservation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Customer Name: \(reservation.customerName)")
            Text("Passport Number: \(reservation.passportNumber)")
            Text("Departure Date: \(reservation.departureDate)")
            Text("Flight Number: \(reservation.flight.flightNumber)")
            Text("Departure City: \(reservation.flight.departureCity)")
            Text("Arrival City: \(reservation.flight.arrivalCity)")
            Text(String(format: "Total Price: $%.2f", reservation.flight.price))
            Text("Booking Number: \(reservation.bookingNumber)")
        }
        .padding()
        .navigationTitle("Reservation Details")
    }
}

struct ReservationDetails_Previews: PreviewProvider {
    static var previews: some View {
        let exampleReservation = Reservation(customerName: "James Franco", passportNumber: "ABCD1234", flight: Flight(flightNumber: "AM3116", departureCity: "ATL", arrivalCity: "MAD", distance: 6943.70, airlineCarrier: "Aeromexico"), departureDate: "2024-02-13")
        ReservationDetails(reservation: exampleReservation)
    }
}
