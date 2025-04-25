//
//  CustomTextView.swift
//  Chinese Counting
//
//  Created by Ronjie Diafante Man-on on 4/25/25.
//

import SwiftUI

struct CustomTextView: View {
    let spacing: Double
    let angle: Double
    let scale: CGSize
    let opacity: Double
    let text1: String
    let text2: String
    let text3: String
    
    var body: some View {
        VStack(spacing: spacing) {
            Text(text1)
                .foregroundStyle(.red)
            Text(text2)
                .foregroundStyle(.blue)
            Text(text3)
                .foregroundStyle(.green)
            
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 25)
            .fill(
                LinearGradient(
                    colors: [.black, .gray],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
                .opacity(opacity)
        )
        .font(.title)
        .fontWeight(.semibold)
        .multilineTextAlignment(.center)
        .padding()
        .scaleEffect(scale)
        .rotation3DEffect(
            Angle(degrees: angle),
            axis: (x: 1.0, y: 0.0, z: 0.0))    }
}

#Preview {
    CustomTextView(
        spacing: 5,
        angle: 45,
        scale: CGSize(width: 0.5, height: 0.5),
        opacity: 1,
        text1: "Line 1",
        text2: "Line 2",
        text3: "Line 3"
    )
}
