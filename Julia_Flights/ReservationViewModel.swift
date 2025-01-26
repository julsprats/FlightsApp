//
//  ReservationViewModel.swift
//  Julia_Flights
//
//  Created by Julia Prats on 2024-02-13.
//

import Foundation

class ReservationViewModel: ObservableObject {
    @Published var reservations: [Reservation] = []
    
    // add a new reservation
    func addReservation(_ reservation: Reservation) {
        reservations.append(reservation)
    }
}
