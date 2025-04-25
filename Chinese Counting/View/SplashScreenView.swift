//
//  SplashScreenView.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/25/25.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isPresented: Bool
    
    @State private var opacity = 0.0
    @State private var scale = CGSize(width: 0.5, height: 0.5)
    @State private var moveUp = false
    @State private var angle = 45.0
    @State private var spacing = 5.0
    
    var chinese: String {
        "chinese"
    }
    
    var pinyin: String {
        "pinyin"
    }
    
    var translation: String {
        "translation"
    }
    
    var proverbVM = ProverbViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color
                    .black
                    .ignoresSafeArea()
                Image("china1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                    .opacity(opacity)
                
                VStack {
                    CustomTextView(
                        spacing: spacing,
                        angle: angle,
                        scale: scale,
                        opacity: opacity,
                        text1: chinese,
                        text2: pinyin,
                        text3: translation
                    )
                    if moveUp {
                        Spacer()
                    }
                }
                
                VStack {
                    Spacer()
                    Button {
                        withAnimation {
                            isPresented.toggle()
                        }
                    } label: {
                        Image("friend")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 75)
                            .clipShape(Capsule())
                            .overlay {
                                Capsule()
                                    .stroke(Color.red, lineWidth: 1)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView(isPresented: .constant(true))
}
