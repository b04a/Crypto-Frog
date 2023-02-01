//
//  String.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 30.01.2023.
//

import Foundation

extension String {
    
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
