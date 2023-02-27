//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by omar nasser on 07/01/2023.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notificationOccurred(type: UINotificationFeedbackGenerator.FeedbackType){
        generator.notificationOccurred(type)
    }
}
