//
//  ContainerView.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/25/25.
//

import SwiftUI

struct ContainerView: View {
    @State var showSplashScreen: Bool = true
    
    var body: some View {
        if showSplashScreen {
            SplashScreenView(isPresented: $showSplashScreen)
        } else {
            MainView()
        }
    }
}

#Preview {
    ContainerView()
}
