//
//  Move.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/19/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct Move: View {
    var activeEnergyPercent: Double = 0.0
    var size: String = "small"
    private let colorVal: Color = Color(hue: 0.93333, saturation: 0.95, brightness: 1.0)
    
    var body: some View {
            Rectangle()
                .fill(colorVal)
            .frame(height: CGFloat(activeEnergyPercent) * CGFloat(5))
                .overlay(Rectangle().stroke(Color.white))
    }
}

struct Move_Previews: PreviewProvider {
    static var previews: some View {
        Move()
    }
}
