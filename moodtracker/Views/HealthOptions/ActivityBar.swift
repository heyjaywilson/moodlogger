//
//  ActivityBar.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/19/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct ActRingBar: View {
    var typeBar: Int // 0 = Move, 1 = Activity, 2 = Stand
    var size: Int // 1 = small, 2 = large
    var percent: Double = 0.0
    
    var colors: [Color] = [Color(hue: 0.93333, saturation: 0.95, brightness: 1.0), Color(hue: 0.23333, saturation: 1.0, brightness: 1.0), Color(hue: 0.52777, saturation: 0.99, brightness: 1.0)]
    
    var body: some View {
        Rectangle()
            .fill(colors[typeBar])
            .frame(width: CGFloat(percent) / CGFloat(2) * CGFloat(size), height: 20)
    }
}

struct ActRingBar_Previews: PreviewProvider {
    static var previews: some View {
        ActRingBar(typeBar: 0, size: 1, percent: 12.0)
    }
}
