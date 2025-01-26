//
//  FlightReservationForm.swift
//  Julia_Flights
//
//  Created by Julia Prats on 2024-02-13.
//

import SwiftUI

struct FlightReservationForm: View {
    @EnvironmentObject var reservationViewModel: ReservationViewModel
    @State private var arrivalAirport: String = ""
    @State private var departureDate: Date = Date()
    @State private var customerName: String = ""
    @State private var passportNumber: String = ""
    @State private var selectedFlight: Flight?
    @State private var confirmationMessage: String = ""
    @State private var reservations: [Reservation] = []
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    let flights = [
        Flight(flightNumber: "AM3116", departureCity: "ATL", arrivalCity: "MAD", distance: 6943.70, airlineCarrier: "Aeromexico"),
        Flight(flightNumber: "WS6463", departureCity: "ATL", arrivalCity: "AUS", distance: 1514.00, airlineCarrier: "Westjet"),
        Flight(flightNumber: "KL662", departureCity: "ATL", arrivalCity: "HKG", distance: 12538.51, airlineCarrier: "KLM")
    ]
    
    var body: some View {
        VStack {
            Text("Flights leaving ATL")
                .font(.title)
                .padding()
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Select an arrival airport")
                Picker("Arrival Airport", selection: $arrivalAirport) {
                    ForEach(flights.map({ $0.arrivalCity }), id: \.self) { city in
                        Text(city)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Customer Name")
                TextField("Enter your name", text: $customerName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Passport Number")
                TextField("Enter your passport number", text: $passportNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack(alignment: .leading, spacing: 10) {
                DatePicker("Departure Date:", selection: $departureDate, in: Date()..., displayedComponents: .date)
            }
            
            if let flight = flights.first(where: { $0.arrivalCity == arrivalAirport }) {
                Text("Flight: \(flight.flightNumber)")
                Text("Operated By: \(flight.airlineCarrier)")
                Text(String(format: "Price: $%.2f", flight.price))
            }
            
            Button(action: {
                if let selectedFlight = selectedFlight {
                    let dateString = dateFormatter.string(from: departureDate)
                    let reservation = Reservation(customerName: customerName, passportNumber: passportNumber, flight: selectedFlight, departureDate: dateString)
                            
                    confirmationMessage = "Reservation confirmed for \(reservation.customerName)!"
                    resetFormFields()
                    reservationViewModel.addReservation(reservation)
                } else {
                    confirmationMessage = "Please select a flight before making a reservation."
                }
            }) {
                Text("Make Reservation")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .alert(isPresented: .constant(!confirmationMessage.isEmpty)) {
                Alert(title: Text("Reservation Confirmation"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
        .onChange(of: arrivalAirport) { newValue, _ in
            selectedFlight = flights.first(where: { $0.arrivalCity == newValue })
            print("Selected Flight: \(String(describing: selectedFlight))")
        }
    }
    
    private func resetFormFields() {
        customerName = ""
        passportNumber = ""
    }
}

struct FlightReservationForm_Previews: PreviewProvider {
    static var previews: some View {
        FlightReservationForm()
    }
}
