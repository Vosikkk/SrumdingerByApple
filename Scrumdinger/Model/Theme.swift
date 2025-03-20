//
//  Theme.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 20.03.2025.
//

import SwiftUI

enum Theme: String {
    
    case bubblegum
    case buttercup
    case indigoo
    case lavender
    case magentaa
    case navy
    case orangee
    case oxblood
    case periwinkle
    case poppy
    case purplee
    case seafoam
    case sky
    case tan
    case teal
    case yelloww
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orangee, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yelloww: return .black
        case .indigoo, .magentaa, .navy, .oxblood, .purplee: return .white
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
}
