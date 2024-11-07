//
//  NotesScreen.swift
//  Assignment-Aisle
//
//  Created by Gaddam, Nagatejesh on 06/11/24.
//

import SwiftUI

struct NotesScreen: View {
    
    @State private var notesReceived: Bool = false
    var authToken: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header
                VStack {
                    Text("Notes")
                        .font(.system(size: 24, weight: .bold, design: .serif)) //Using Serif design because Gilroy font is not available in-built.
                        .padding(.bottom, 1)
                    Text("Personal messages to you")
                        .font(.system(size: 16, weight: .medium, design: .serif))
                        .foregroundColor(.black)
                }
                Image("Meena")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .cornerRadius(20)
                    .clipped()
                    .padding()
                // Interested In You Section
                VStack(alignment: .leading, spacing: 0) {
                    Text("Interested In You")
                        .font(.system(size: 23, weight: .bold, design: .serif))
                        .padding(.leading, 15)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Premium members can")
                                .font(.system(size: 15, design: .serif))
                                .foregroundColor(.gray)
                            Text("view all their likes at once")
                                .font(.system(size: 15, design: .serif))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            // Upgrade button action
                        }) {
                            Text("Upgrade")
                                .font(.system(size: 15, weight: .bold))
                                .frame(width: 100, height: 40)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 6)
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(50)
                        }
                        .padding(.top, -10)
                    }
                    .padding(.leading, 15)
                    // Profile Cards Row
                    HStack(spacing: 16) {
                        ProfileCardView(name: "Teena")
                        ProfileCardView(name: "Beena")
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .scrollIndicators(.hidden)
        .onAppear {
            NotesViewModel.fetchNotes(authToken: authToken, completion: { result in
                switch result {
                case .success(let notesReceived):
                    self.notesReceived = notesReceived
                case .failure(let error):
                    print("Error: \(error)")
                }
            })
        }
        .navigationBarHidden(true)
    }
}

struct NotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        NotesScreen(authToken: "")
    }
}
