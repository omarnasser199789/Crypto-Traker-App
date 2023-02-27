//
//  SettingsView.swift
//  SwiftfulCrypto
//
//  Created by omar nasser on 31/01/2023.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let linkedinURL = URL(string: "https://www.linkedin.com/in/omar-mouhamad-nasser/")!
    let coingeckoURL = URL(string: "https://www.buymeacoffee.com")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/omarnaser1i")!
    let personalRUL = URL(string: "https://omar-nasser-portfolio.web.app/#/")!
    
    
    var body: some View {
        NavigationView{
            List {
                infoSection
                coinGeckoSection
                developerSection
                applicationSection
             
            }
         
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


extension SettingsView {
    private var infoSection: some View {
        Section(header: Text("info")){
            VStack(alignment: .leading){
                
                Image("logo")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app was made by Omar Nasser. It uses MVVM Architecture, Combine, and CoreDara!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
                
            }
            
            .padding(.vertical)
            Link("Connect me on Linkedin 🥳",destination: linkedinURL)
            Link("Support his coffee addiction ☕️",destination: coffeeURL)
            
     
        }
     
    }
    
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")){
            VStack(alignment: .leading){
                
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
                
            }
            
            .padding(.vertical)
            Link("Visit CoinGecko",destination: coingeckoURL)
            
     
        }
     
    }
    
    
    
    private var developerSection: some View {
        Section(header: Text("Developer")){
            VStack(alignment: .leading){
                
                Image("logo")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app was developeed by Omar Nasser. It uses SwifUI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers, and data presistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
                
            }
            
            .padding(.vertical)
            Link("Visit Website",destination: personalRUL)
            
     
        }
     
    }
    
    private var applicationSection: some View {
        Section(header: Text("Developer")){
        
            Link("Tearms of Service",destination: defaultURL)
            Link("Privacy Policy",destination: defaultURL)
            Link("Company Website",destination: defaultURL)
            Link("Learn more",destination: defaultURL)
     
        }
     
    }
    
    
     
    }

