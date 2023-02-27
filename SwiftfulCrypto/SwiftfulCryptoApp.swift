//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by omar nasser on 27/12/2022.
//

import SwiftUI
 
@main
struct SwiftfulCryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    @State private var showLanchView: Bool = true
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            
            ZStack{
                NavigationView{
                    HomeView()
                        // this way that bar doesn't show up on the home view
                        .navigationBarHidden(true)
                        
                }
                // Add inviromentObject
                //Now we have this environment object on the navigation view
                //All of the children views of this navigation
                //anything in the home view or a child of the home has access to this view model
                .environmentObject(vm)
                
                
                ZStack{
                    if showLanchView {
                        launchView(showLaunchView: $showLanchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
                
              
              
                
            }
            
           
        }
    }
}
