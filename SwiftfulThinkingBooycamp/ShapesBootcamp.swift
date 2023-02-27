//
//  ShapesBootcamp.swift
//  SwiftfulThinkingBooycamp
//
//  Created by omar nasser on 31/01/2023.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
//      Circle()
//        Ellipse()
//        Capsule()
//        Rectangle()
        RoundedRectangle(cornerRadius: 50)
            .trim(from: 0.4 ,to: 1.0)
//            .stroke(Color.red, style: StrokeStyle(
//                lineWidth: 30,
////                lineCap: .round,
//                lineCap: .butt,
//                dash: [30]
//            ))
        
            .fill(.red)
//            .foregroundColor(.black)
        
            .frame(width: 500,height: 300)
          
    }
}

struct ShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapesBootcamp()
    }
}
