//
//  SettingView.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 31.01.2023.
//

import SwiftUI

struct SettingView: View {
    
    let githubURL = URL(string: "https://github.com/plusfuturehendrix")!
    let coingeckoURL = URL(string: "https://www.coingecko.com/")!
    
    var body: some View {
        NavigationView {
            List {
                profileInfo
                coingeckoInfo
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Setting")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton()
                }
            }
        }
    }
}

extension SettingView {
    
    private var profileInfo: some View {
        Section(header: Text("Code")) {
            HStack {
                Image("future")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Creator")
                        .font(.system(size: 25))
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("+futurehendrix")
                        .font(.title)
                        .font(.system(size: 12))
                        .foregroundColor(Color.theme.secondaryText)
                    
                    
                    Link(destination: githubURL) {
                        Text("Github")
                            .font(.system(size: 20))
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
    
    private var coingeckoInfo: some View {
        Section(header: Text("Support")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("CoinGecko")
                        .font(.system(size: 25))
                        .fontWeight(.bold)

                    Text("Thanks for the API for the app!")
                        .font(.system(size: 20))
                        .foregroundColor(Color.theme.secondaryText)
                    
                    Link(destination: coingeckoURL) {
                        Text("Website CoinGecko")
                            .font(.system(size: 20))
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
