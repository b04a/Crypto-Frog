//
//  Data.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 31.01.2023.
//

import Foundation


extension Date {
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDataString() -> String {
        return shortFormatter.string(from: self)
    }
}
