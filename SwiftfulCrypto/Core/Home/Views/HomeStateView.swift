//
//  HomeStateView.swift
//  SwiftfulCrypto
//
//  Created by omar nasser on 31/12/2022.
//

import SwiftUI

struct HomeStateView: View {

   
    
   
    @EnvironmentObject private var vm: HomeViewModel
    
    @Binding var showProtfolio: Bool
    
    let width = UIScreen.main.bounds.width

    var body: some View {
      
        HStack{
            ForEach(vm.statistics){ stat in
                StatisticView(stat: stat)
                    .frame(width: width / 3)
            }
        }
        .frame(width: width,alignment: self.showProtfolio ? .trailing :.leading)
    }
}

struct HomeStateView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStateView(showProtfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
