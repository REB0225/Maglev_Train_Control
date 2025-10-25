//
//  Sliders.swift
//  Esp32LedSwitcher
//
//  Created by 徐來慶 on 2025/4/23.
//

import SwiftUI

struct Sliders: View {
    
    @State var maxValue = 45
    @Binding var sliderValues: SliderValues
    @State var adjustValue: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                OneSlider(value: $sliderValues.LT, adjustValue: adjustValue, maxValue: maxValue)
                Spacer()
                OneSlider(value: $sliderValues.RT, adjustValue: adjustValue, maxValue: maxValue)
            }
            Spacer()
            HStack{
                OneSlider(value: $sliderValues.LB, adjustValue: adjustValue, maxValue: maxValue)
                Spacer()
                OneSlider(value: $sliderValues.RB, adjustValue: adjustValue, maxValue: maxValue)
            }
            Spacer()
        }
    }
}

#Preview {
    Sliders(sliderValues: .constant(SliderValues(LB: 0, LT: 0, RB: 0, RT: 0)))
}
