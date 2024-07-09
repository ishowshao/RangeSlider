//
//  RangeSlider.swift
//  RangeSlider
//
//  Created by 荒野老男人 on 2024/7/8.
//

import SwiftUI

struct RangeSlider: View {
    @Binding var lowerValue: Double
    @Binding var upperValue: Double
    @State private var filledStart: Double = 50
    @State private var filledWidth: Double = 100
    
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(Color.gray.opacity(0.2))
            .frame(height: 4)
            .overlay {
                GeometryReader { geometry in
                    ZStack {
                        RangeSliderFilledTrack()
                            .frame(width: geometry.size.width)
                            .position(CGPoint(x: geometry.size.width / 2, y: 2.0))
                        RangeSliderHandle(onChanged: { changed in
                            
                        })
                        .position(CGPoint(x: 0.0, y: 2.0))
                        RangeSliderHandle(onChanged: { changed in
                            
                        })
                        .position(CGPoint(x: geometry.size.width, y: 2.0))
                    }
                }
            }
    }
}

struct RangeSliderFilledTrack: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 9/255, green: 124/255, blue: 245/255), Color(red: 9/255, green: 126/255, blue: 248/255)]), startPoint: .top, endPoint: .bottom))
            .frame(height: 4)
    }
}

struct RangeSliderHandle: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isPressed = false
    private let lightDefault = Color.white
    private let lightPressed = Color(red: 240/255, green: 240/255, blue: 240/255)
    private let darkDefault = Color.gray
    private let darkPressed = Color(red: 174/255, green: 174/255, blue: 174/255)
    
    var onChanged: (Double) -> Void
    
    var body: some View {
        Circle()
            .fill(colorScheme == .dark ? (isPressed ? darkPressed : darkDefault) : (isPressed ? lightPressed : lightDefault))
            .frame(width: 20, height: 20)
            .shadow(radius: 1, y: 0.5)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        isPressed = true
                        onChanged(value.location.x - value.startLocation.x)
                    }
                    .onEnded { _ in
                        isPressed = false
                    }
            )
    }
}

#Preview {
    RangeSlider(lowerValue: .constant(0.0), upperValue: .constant(5.0))
        .frame(width: 300)
        .padding()
}

#Preview {
    RangeSliderHandle(onChanged: { changed in
        print(changed)
    })
        .padding()
}
