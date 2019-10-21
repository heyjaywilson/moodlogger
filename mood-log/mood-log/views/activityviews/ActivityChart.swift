//
//  ActivityChart.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct ActivityChart: View {
    var movePercent: Double
    var excePercent: Double
    var stanPercent: Double
    
    var body: some View {
        HStack(alignment: .bottom) {
            BarForCharts(barLabel: "M", barAmt: self.movePercent/2.0, fill: Color.red)
            BarForCharts(barLabel: "E", barAmt: self.excePercent/2.0, fill: Color.yellow)
            BarForCharts(barLabel: "S", barAmt: self.stanPercent/2.0, fill: Color.blue)
        }
    }
}

struct ActivityChart_Previews: PreviewProvider {
    static var previews: some View {
        ActivityChart(movePercent: 10.0, excePercent: 60.0, stanPercent: 100.0)
    }
}
