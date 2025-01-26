//
//  ReservationHistoryScreen.swift
//  Julia_Flights
//
//  Created by Julia Prats on 2024-02-13.
//

import SwiftUI

struct ReservationHistoryScreen: View {
    @EnvironmentObject var reservationViewModel: ReservationViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(reservationViewModel.reservations, id: \.bookingNumber) { reservation in
                    NavigationLink(destination: ReservationDetails(reservation: reservation)) {
                        ReservationRow(reservation: reservation)
                    }
                }
                .onDelete(perform: deleteReservation)
            }
            .navigationTitle("Reservation History")
        }
    }
    
    // delete reservations swiping
    func deleteReservation(at offsets: IndexSet) {
        reservationViewModel.reservations.remove(atOffsets: offsets)
    }
}

struct ReservationRow: View {
    let reservation: Reservation
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(reservation.customerName)
                    .font(.headline)
                Text("Booking ID: \(reservation.bookingNumber)")
                    .font(.subheadline)
            }
        }
    }
}

struct ReservationHistoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReservationHistoryScreen()
    }
}
