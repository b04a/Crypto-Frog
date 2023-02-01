//
//  HomeStaticView.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 24.01.2023.
//

import SwiftUI

struct HomeStaticView: View {

    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statictics) { stat in
                StaticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading
        )
    }
}

struct HomeStaticView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStaticView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
