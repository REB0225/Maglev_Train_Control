//
//  ControllerView.swift
//  Esp32LedSwitcher
//
//  Created by 徐來慶 on 2025/2/17.
//

import SwiftUI

struct SliderValues: Equatable {
    var LB: CGFloat
    var LT: CGFloat
    var RB: CGFloat
    var RT: CGFloat
}

struct ControllerView: View {
    @StateObject var bleManager = BLEManager()
    let quarterRadian: Double = .pi / 6
    @State private var sliderValues = SliderValues(LB: 0, LT: 0, RB: 0, RT: 0)
    @State var servoTweaks = SliderValues(LB: 6/9, LT: 7/9, RB: 19/36, RT: 6/9)
    let theAccentColor: Color = .accentColor
    
    func calculateSend(val: CGFloat, tweak: CGFloat) -> CGFloat{
        return 0.5 + val/2 + tweak
    }
    
    func send() {
        bleManager.sendData(String("\(Int(calculateSend(val: sliderValues.LB, tweak: servoTweaks.LB) * 90)),\(Int(calculateSend(val: sliderValues.LT, tweak: servoTweaks.LT) * 90)),\(Int(calculateSend(val: sliderValues.RB, tweak: servoTweaks.RB) * 90)),\(Int(calculateSend(val: sliderValues.RT, tweak: servoTweaks.RT) * 90))"))
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Sliders(sliderValues: $sliderValues)
                Button("Send"){
                    send()
                }
                Text(bleManager.gotResponseText)
            }
            .onAppear(){
                send()
            }
            .padding(20)
            .onChange(of: sliderValues) { _ in
                send()
            }
            .toolbar {
                NavigationLink(destination: ServoTweaker(servoTweaks: $servoTweaks)){
                    Label("Settings", systemImage: "gear")
                }
            }
            .navigationTitle("Controller")
        }
    }
}

#Preview {
    ControllerView()
}
