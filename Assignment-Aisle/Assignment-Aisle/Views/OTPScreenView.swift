//
//  OTPScreenView.swift
//  Assignment-Aisle
//
//  Created by Gaddam, Nagatejesh on 06/11/24.
//


import SwiftUI

struct OTPScreenView: View {
    @State private var otpCode: String = ""
    @State private var timerCount: Int = 59 // Timer starts at 59 seconds
    @State private var authToken: String?
    @State private var isNavigatingToNotes = false
    var phoneNumber: String
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Phone Number Display
            HStack {
                Text("+91 \(phoneNumber)")
                    .font(.system(size: 20, weight: .medium))
                Image(systemName: "pencil")
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .bold))
                    .imageScale(.large)
                    .frame(width: 10)
            }
            .padding(.top, 67)
            
            // Title
            VStack(alignment: .leading){
                Text("Enter The")
                    .font(.system(size: 34, weight: .heavy))
                    .fontWeight(.bold)
                Text("OTP")
                    .font(.system(size: 34, weight: .heavy))
                    .fontWeight(.bold)
            }
            // OTP Entry Field
            TextField("0000", text: $otpCode)
                .keyboardType(.numberPad)
                .font(.system(size: 18, weight: .bold))
                .padding()
                .frame(width: 80, height: 40)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            // Continue Button with Timer
            HStack(spacing: 16) {
                Button(action: {
                    let phoneNumber = "+919876543212"
                    OTPVerificationViewModel.otpVerify(number: phoneNumber, otp: self.otpCode) { result in
                        switch result {
                        case .success(let token):
                            self.authToken = token
                            self.isNavigatingToNotes = true
                        case .failure(let error):
                            print("Error: \(error)")
                        }
                    }
                }) {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 120, height: 45)
                        .background(Color.yellow)
                        .cornerRadius(50)
                }
                // Timer Countdown
                Text("00:\(timerCount < 10 ? "0" : "")\(timerCount)")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.black)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                            if self.timerCount > 0 {
                                self.timerCount -= 1
                            } else {
                                timer.invalidate()
                            }
                        }
                    }
            }
            .padding(.top, 5)
            NavigationLink(destination: ContentView(authToken: authToken ?? ""), isActive: $isNavigatingToNotes) {
                EmptyView()
            }
            Spacer()
        }
        .padding(.leading, 35)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationBarHidden(true)
    }
}

struct OTPScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OTPScreenView(phoneNumber: "9999999999")
    }
}
