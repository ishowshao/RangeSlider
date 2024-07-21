//
//  ContentView.swift
//  RangeSlider
//
//  Created by 荒野老男人 on 2024/7/8.
//

import SwiftUI

struct ContentView: View {
    @State private var lowerValue: Double = 0.0
    @State private var upperValue: Double = 1.0
    
    var body: some View {
        VStack {
            HStack {
                Text("Lower Value: \(lowerValue)")
                Button("Reset") {
                    lowerValue = 0.0
                }
            }
            HStack {
                Text("Upper Value: \(upperValue)")
                Button("Reset") {
                    upperValue = 1.0
                }
            }
            RangeSlider(lowerValue: $lowerValue, upperValue: $upperValue)
                .frame(width: 400)
                .onChange(of: lowerValue) { _, newValue in
                    print(newValue)
                }
                .onChange(of: upperValue) { _, newValue in
                    print(newValue)
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
