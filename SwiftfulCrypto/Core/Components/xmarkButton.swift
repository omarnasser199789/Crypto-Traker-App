//
//  xmarkButton.swift
//  SwiftfulCrypto
//
//  Created by omar nasser on 01/01/2023.
//

import SwiftUI

struct XMarkButton: View {
    
//    @Environment(\.presentationMode) var  presentationMode
    
    var body: some View {
        Button(action: {
    
//            presentationMode.wrappedValue.dismiss()
            
        }, label: {
            Image(systemName: "xmark")

                .font(.headline)
        })
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
