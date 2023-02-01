//
//  CircleButton.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 20.01.2023.
//

import SwiftUI

struct CircleButton: View {
    
    let iconString: String
    
    var body: some View {
        Image(systemName: iconString)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.backgound)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0
            )
            .padding()
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(iconString: "info")
            .padding()
            .previewLayout(.sizeThatFits)
        
        CircleButton(iconString: "plus")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
