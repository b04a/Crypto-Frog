//
//  UIApplicattion.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 23.01.2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
