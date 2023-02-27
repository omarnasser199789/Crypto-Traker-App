//
//  ProtfolioView.swift
//  SwiftfulCrypto
//
//  Created by omar nasser on 01/01/2023.
//

import SwiftUI

struct ProtfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    @Environment(\.presentationMode) var  presentationMode
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment:.leading, spacing: 0){
            
                    SearchBarView(searchText: $vm.searchText)
                    
                    coinLogoList
                    
                    if selectedCoin != nil{
                        portfolioInputSection
                    }
                    
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(
                content:{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.headline)
                        })
                        
                    }
                    
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                
                        trailingNavBarButton
                    }
                }
            )
            .onChange(of: vm.searchText, perform: { value in
                
                if value == "" {
                    removeSelectedCoin()
                }
                
            })
        }
        
    }
}

struct ProtfolioView_Previews: PreviewProvider {
    static var previews: some View {
        ProtfolioView()
            .environmentObject(dev.homeVM)
    }
}


extension  ProtfolioView {
    
    private var coinLogoList: some View{
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack(spacing: 10){
                ForEach(vm.allCoins){ coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn){
                               updateSelectedCoin(coin: coin)
                            }
                        }
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear , lineWidth: 1)
                        )
                    
                    
                }
            }
            .frame(height:120)
            .padding(.leading
            )
            
        }
    }
    
    private func updateSelectedCoin(coin: CoinModel){
        selectedCoin = coin
        
        if let protfolioCoin = vm.portfolioCoins.first(where: {$0.id == coin.id }),
           let amount = protfolioCoin.currentHoldings{
            quantityText = "\(amount)"
        } else{
            quantityText = ""
        }
    }
    
    private func getCurrentValue() -> Double {
        
        if let quantity = Double(quantityText){
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20){
            HStack{
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack{
                Text("Amount holding:")
                
                Spacer()
                TextField("Ex: 1.4",text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack{
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        //                        .animation(.none)
        .padding()
        .font(.headline)
    }
    
    
    private var trailingNavBarButton: some View {
        HStack(spacing:10){
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            Button {
                saveButtonPressed()
            } label: {
                Text("Save".uppercased())
            }.opacity(
                (selectedCoin != nil &&
                 selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0
            )
            
            
            
        }
        .font(.headline)
    }
    
    
    private func saveButtonPressed(){
        
        guard
            let coin = selectedCoin,
            let amount = Double(quantityText)
            else{ return }
                
        
        // save to portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        // show checkmark
        withAnimation(.easeIn){
            showCheckmark = true
            removeSelectedCoin()
        }
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            withAnimation(.easeOut) {
                
                showCheckmark = false
            }
        }
    }
    
    
    private func removeSelectedCoin(){
        selectedCoin = nil
        vm.searchText = ""
    }
}
