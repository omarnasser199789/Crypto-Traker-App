//
//  DetailView.swift
//  SwiftfulCrypto
//
//  Created by omar nasser on 23/01/2023.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View{
        ZStack{
            if let coin = coin{
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    @StateObject private var vm: DetailViewModel
    @State private var showFullDescription: Bool = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 30.0

    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Initializing Detail View for \(coin.name)")
    }
    
    var body: some View {
        ScrollView{
            
            VStack{
                CharView(coin: vm.coin)
                    .padding(.vertical)
                VStack(spacing: 20){
                    overviewTitle
                    Divider()
                    
                    
                    descrptionSection
                    
                    
                    overviewGrid
                    additinoalTitle
                    Divider()
                    additionalGrid
                    
                    websiteSection
                   
                    
                }
                .padding()
            }
            
         
        }
        .navigationTitle(vm.coin.name)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                navigationBarTrailingItem
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(coin: dev.coin)
        }
        
    }
}

extension DetailView {
    
    private var navigationBarTrailingItem: some View {
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
            .foregroundColor(.theme.secondaryText)
            
            CoinImageView(coin: vm.coin)
                .frame(width: 25,height: 25)


        }
    }
    
    
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var descrptionSection: some View {
        ZStack(){
            if let coinDescription = vm.coinDescription, !coinDescription.isEmpty{
                VStack(alignment: .leading) {
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(.theme.secondaryText)
                    
                    Button (action:{
                
                        withAnimation(.easeInOut){
                            showFullDescription.toggle()
                        }
                    }, label: {
                        Text(showFullDescription ? "Less" : "Read more...")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    })
                    .accentColor(.blue)

                }
                .frame(width: .infinity, alignment: .leading)
            }
        }
    }
    
    
    private var additinoalTitle: some View{
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var overviewGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: [],
            content: {
                ForEach(vm.overviewStatistics){ stat in
                    StatisticView(stat: stat)
                    
                }
            }
        )
    }
    
    private var additionalGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: [],
            content: {
                ForEach(vm.additinalStatistics){ stat in
                    StatisticView(stat:stat)
                    
                }
            }
        )
    }
    
    
    
    private var websiteSection: some View {
        VStack(alignment: .leading,spacing: 20){
            if let websiteString = vm.websiteURL,
               let url = URL(string: websiteString){
                Link("Website", destination:  url)
            }
            
            if let redditString = vm.redditURL,
               let url = URL(string: redditString){
                Link("Reddit", destination:  url)
            }
            
        }
        .accentColor(.blue)
        .frame(maxWidth:.infinity, alignment: .leading)
        .font(.headline)
    }
}
