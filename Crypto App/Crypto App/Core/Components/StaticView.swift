//
//  StaticView.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 24.01.2023.
//

import SwiftUI

struct StaticView: View {
    
    let stat: StaticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees:(stat.percentChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.percentChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.percentChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentChange == nil ? 0.0 : 1.0)
        }
    }
}

struct StaticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StaticView(stat: dev.state1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            StaticView(stat: dev.state2)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            StaticView(stat: dev.state3)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        
    }
}
