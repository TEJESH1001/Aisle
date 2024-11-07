//
//  ContentView.swift
//  Assignment-Aisle
//
//  Created by Gaddam, Nagatejesh on 06/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1
    var authToken: String
    var body: some View {
        TabView(selection: $selectedTab) {
            DiscoverScreenView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Discover")
                }
                .tag(0)
            NotesScreen(authToken: authToken)
                       .tabItem {
                           Image(systemName: "envelope.fill")
                           Text("Notes")
                       }
                       .badge(5)
                       .tag(1)
                   MatchesView()
                       .tabItem {
                           Image(systemName: "message.fill")
                           Text("Matches")
                       }
                       .badge(50)
                       .tag(2)
                   ProfileView()
                       .tabItem {
                           Image(systemName: "person.fill")
                           Text("Profile")
                       }
                       .tag(3)
               }
        .accentColor(Color.black)
        .onAppear {
            self.selectedTab = 1
        }
    }
}

struct DiscoverScreenView: View {
    var body: some View {
        Text("DiscoverScreenView")
            .font(.largeTitle)
            .padding()
    }
}

struct MatchesView: View {
    var body: some View {
        Text("Matches Screen")
            .font(.largeTitle)
            .padding()
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Screen")
            .font(.largeTitle)
            .padding()
    }
}
#Preview {
    ContentView(authToken: "")
}
