//
//  File.swift
//  
//
//  Created by Thomas Ricouard on 02/07/2020.
//

import SwiftUI

public let UIBundle = Bundle.module

extension Color {
    public static var background: Color {
        Color("Background", bundle: Bundle.module)
    }
    
    public static var appAccentColor: Color {
        Color("AccentColor", bundle: Bundle.module)
    }
}
