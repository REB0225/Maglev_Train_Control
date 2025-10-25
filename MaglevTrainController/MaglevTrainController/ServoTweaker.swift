//
//  ServoTweaker.swift
//  Esp32LedSwitcher
//
//  Created by 徐來慶 on 2025/4/23.
//

import SwiftUI

struct ServoTweaker: View {
    
    @Binding var servoTweaks: SliderValues
    
    var body: some View {
        Sliders(maxValue: 90, sliderValues: $servoTweaks, adjustValue: -0.5)
            .navigationTitle("Tweaker")
    }
}

#Preview {
    ServoTweaker(servoTweaks: .constant(SliderValues(LB: 0, LT: 0, RB: 0, RT: 0)))
}
