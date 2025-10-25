//
//  OneSlider.swift
//  Esp32LedSwitcher
//
//  Created by 徐來慶 on 2025/4/23.
//

import SwiftUI

struct OneSlider: View {
    
    @Binding var value: CGFloat
    @State var adjustValue: CGFloat
    @State var maxValue: Int
    
    var body: some View {
        Spacer()
        VStack{
            CustomSliderView(width:200, values: $value)
            Text(String(Int((value+adjustValue) * CGFloat(maxValue))))
        }
        Spacer()
    }
}

#Preview {
    OneSlider(value: .constant(0), adjustValue: 0, maxValue: 180)
}
