//
//  BarForCharts.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/8/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct BarForCharts: View {
    var barLabel: String
    var barAmt: Double
    var fill: Color
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 5, style: .circular)
                .fill(fill)
                .frame(width: 15, height: self.getHeight())
            Text(barLabel)
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
    }
    
    func getHeight() -> CGFloat{
        if barAmt > 50.0 {
            return CGFloat(exactly: 50)!
        } else {
            return CGFloat(exactly: barAmt)!
        }
    }
}

struct BarForCharts_Previews: PreviewProvider {
    static var previews: some View {
        BarForCharts(barLabel: "M", barAmt: 12.0, fill: Color.red)
    }
}

extension Double {
    func string(fractionDigits:Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
