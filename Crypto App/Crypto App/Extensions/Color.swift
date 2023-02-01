//
//  Color.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 20.01.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let lauch = LaunchTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let backgound = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
    
}


struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
