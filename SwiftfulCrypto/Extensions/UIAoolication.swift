//
//  UIAoolication.swift
//  SwiftfulCrypto
//
//  Created by omar nasser on 28/12/2022.
//

import Foundation
import SwiftUI

extension UIApplication{
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder),to: nil, from: nil, for: nil)
    
    }
}
