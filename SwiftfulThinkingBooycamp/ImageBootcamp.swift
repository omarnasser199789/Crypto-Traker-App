//
//  ImageBootcamp.swift
//  SwiftfulThinkingBooycamp
//
//  Created by omar nasser on 11/02/2023.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        Image("imge2")
//            .renderingMode(.template)
            .resizable()
//            .aspectRatio(contentMode: .fit)
            .frame(width: 300,height: 300)
//            .clipped()
//            .cornerRadius(300)
            .foregroundColor(.red)
    }
}

struct ImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootcamp()
    }
}
