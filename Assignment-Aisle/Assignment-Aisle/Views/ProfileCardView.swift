//
//  ProfileCardView.swift
//  Assignment-Aisle
//
//  Created by Gaddam, Nagatejesh on 07/11/24.
//

import SwiftUI

struct ProfileCardView: View {
    var name: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(name)
                .frame(width: (UIScreen.main.bounds.width - 64) / 2, height: 280)
                .cornerRadius(15)
                .blur(radius: 10)
            
            Text(name)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .padding([.leading, .bottom], 8)
        }
    }
}
