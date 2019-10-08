//
//  ActivityChart.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct ActivityChart: View {
    @State private var movePercent = 50
    @State private var excePercent = 78
    @State private var stanPercent = 100
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack{
                RoundedRectangle(cornerRadius: 5, style: .circular)
                    .fill(Color.red)
                    .frame(width: 15, height: CGFloat(integerLiteral: movePercent))
                Text("M")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            VStack{
                RoundedRectangle(cornerRadius: 5, style: .circular)
                    .fill(Color.green)
                    .frame(width: 15, height: CGFloat(integerLiteral: excePercent))
                Text("E")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            VStack{
                RoundedRectangle(cornerRadius: 5, style: .circular)
                    .fill(Color.blue)
                    .frame(width: 15, height: CGFloat(integerLiteral: stanPercent))
                Text("S")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
        }.onAppear {
            self.checkIfAbove()
        }
    }
    
    func checkIfAbove(){
        if movePercent > 100 {
            movePercent = 100
        }
        if excePercent > 100 {
            excePercent = 100
        }
        if stanPercent > 100 {
            stanPercent = 100
        }
    }
}

struct ActivityChart_Previews: PreviewProvider {
    static var previews: some View {
        ActivityChart()
    }
}
