//
//  SwiftUIView.swift
//  Toggle
//
//  Created by itsDEVbilal on 14/08/2023.
//

import SwiftUI

struct ToggleView: View {
    @State private var isOn = false
    var body: some View {
        // Toggle with Custom Styling in SwiftUI
        VStack{
            Toggle(isOn: $isOn){
               
                    Text("Custom Style Toggle")
                
            }
            .toggleStyle(CustomToggleStyle())
        }
        
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}


struct CustomToggleStyle: ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.label
            Spacer()
            Rectangle()
                .fill(configuration.isOn ? Color.green : Color.red)
                .frame(width: 50, height: 30, alignment: .center)
                .cornerRadius(20)
                .overlay(Circle()
                    .foregroundColor(Color.white)
                    .padding(2)
                    .offset(x: configuration.isOn ? 10 : -10), alignment: .center
                    )
                .onTapGesture{
                    configuration.isOn.toggle()
                }
                .animation(.linear(duration: 0.2))
        }
        .padding()
    }
}
