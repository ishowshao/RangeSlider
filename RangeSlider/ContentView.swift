//
//  ContentView.swift
//  RangeSlider
//
//  Created by 荒野老男人 on 2024/7/8.
//

import SwiftUI

struct ContentView: View {
    @State private var lowerValue: Double = 0.0
    @State private var upperValue: Double = 50.0
    
    var body: some View {
        VStack {
            RangeSlider(lowerValue: $lowerValue, upperValue: $upperValue)
                .frame(width: 400)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
