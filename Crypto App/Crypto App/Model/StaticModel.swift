//
//  StaticModel.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 24.01.2023.
//

import Foundation


struct StaticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentChange: Double?
    
    init(title: String, value: String, percentChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentChange = percentChange
    }
}

