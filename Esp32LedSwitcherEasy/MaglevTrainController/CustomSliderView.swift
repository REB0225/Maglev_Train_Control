//
//  CustomSliderView.swift
//  Esp32LedSwitcher
//
//  Created by 徐來慶 on 2025/3/24.
//

import SwiftUI

struct CustomSliderView: View {
    
    var width: CGFloat = 100
    var height: CGFloat = 220
    @State var place: CGFloat = 0
    @State var realPlace: CGFloat = 0
    @Binding var values: CGFloat
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: width/5, height: height)
                .foregroundStyle(Color.gray)
                .cornerRadius(.infinity)
            Rectangle()
                .frame(width: width/5, height: -place)
                .cornerRadius(.infinity)
                .offset(x: 0, y: place/2+height/2)
                .foregroundStyle(Color.accentColor)
            Rectangle()
                .frame(width: width/2, height: width/5)
                .foregroundStyle(Color.primary)
                .cornerRadius(.infinity)
                .offset(x: 0, y: place+height/2)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            place = max(-height, realPlace + value.translation.height)
                            if place > 0 {
                                place = 0
                            }
                            values = -(place/height)
                        }
                        .onEnded { value in
                            realPlace = place
                    }
                )
                .onAppear(){
                    realPlace = -(values * height)
                    place = -(values * height)
                }
        }
        .padding(width/10)
    }
}

#Preview {
    CustomSliderView(values: .constant(0.5))
}
