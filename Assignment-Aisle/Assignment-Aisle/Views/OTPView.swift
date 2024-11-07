//
//  OTPView.swift
//  Assignment-Aisle
//
//  Created by Gaddam, Nagatejesh on 06/11/24.
//

import SwiftUI

struct OTPView: View {
    @State private var phoneNumber: String = ""
    @State private var isNavigatingToOTP = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Get OTP")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.top, 120)
                Text("Enter Your\nPhone Number")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.black)
                HStack {
                    Text("+91")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                        .padding()
                        .frame(height: 40)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.numberPad)
                        .font(.system(size: 18, weight: .bold))
                        .padding()
                        .frame(width: 170, height: 40)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }
                Button(action: {
                    LoginViewModel.phoneNumberLogin(number: "+91\(self.phoneNumber)") { result in
                        switch result {
                        case .success( _):
                            self.isNavigatingToOTP = true
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
                .padding(.top, 10)
                Spacer()
                NavigationLink(destination: OTPScreenView(phoneNumber: phoneNumber), isActive: $isNavigatingToOTP) {
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, 35)
            .background(Color.white)
            .ignoresSafeArea()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}
 
struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
