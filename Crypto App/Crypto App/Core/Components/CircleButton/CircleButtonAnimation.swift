//
//  CircleButtonAnimation.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 20.01.2023.
//

import SwiftUI

struct CircleButtonAnimation: View {
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeInOut(duration: 1.0) : .none)
            .onAppear {
                animate.toggle()
            }
    }
}

struct CircleButtonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimation(animate: .constant(false))
    }
}
