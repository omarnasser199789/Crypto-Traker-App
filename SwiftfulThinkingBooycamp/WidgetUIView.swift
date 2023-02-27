//
//  WidgetUIView.swift
//  SwiftfulThinkingBooycamp
//
//  Created by omar nasser on 13/02/2023.
//

import SwiftUI

struct WidgetUIView: View {
    
    let bgColor: Color
    let title: String
    
    init(name: Name) {
        
        if name == .nasser{
            self.title = "Nasser"
            self.bgColor = Color.red
        }else if name == .omar{
            self.title = "Omar"
            self.bgColor = Color.green
        }
        else {
            self.title = ""
            self.bgColor = Color.blue
        }
     
      
    }
    
    enum Name{
        case omar
        case nasser
    }
    
    var body: some View {
        
        VStack(spacing:20){
            Text(title)
                .font(.largeTitle)
                
            Text("100")
                .font(.headline)
                .underline()
        }
            .frame(width: 200,height: 200)
            .background(bgColor)
            .cornerRadius(20)
    }
}

struct WidgetUIView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetUIView(name:.omar)
    }
}
