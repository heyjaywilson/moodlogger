//
//  ActivityChart.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct ActivityChart: View {
    var movePercent = 130.0
    var excePercent = 78.0
    var stanPercent = 50.0
    
    var body: some View {
        HStack(alignment: .bottom) {
            BarForCharts(barLabel: "M", barAmt: self.movePercent, fill: Color.red)
            BarForCharts(barLabel: "E", barAmt: self.excePercent, fill: Color.yellow)
            BarForCharts(barLabel: "S", barAmt: self.stanPercent, fill: Color.blue)
        }
    }
}

struct ActivityChart_Previews: PreviewProvider {
    static var previews: some View {
        ActivityChart()
    }
}
