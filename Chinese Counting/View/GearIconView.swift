//
//  GearIconView.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/25/25.
//

import SwiftUI

struct GearIconView: View {
    @Binding var showSettings: Bool
            
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        showSettings.toggle()
                    }
                } label: {
                    Image(systemName: "gearshape")
                        .imageScale(.large)
                }
                .foregroundStyle(showSettings ? .gray : Color("imageColor"))
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ZStack {
        Color
            .blue
            .opacity(0.3)
            .ignoresSafeArea()
        GearIconView(showSettings: .constant(true))
    }
}
