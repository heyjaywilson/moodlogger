//
//  RowLog.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/30/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct RowLog: View {
    var log: LogEntity
    var body: some View {
        HStack{
            DateRow(month: log.date!.returnShortMonth(), day: log.date!.returnDayAsString())
            VStack{
                Text("Moods")
                HStack{
                    SlotTwo()
                    SlotThree()
                }
                HStack{
                    SlotFour()
                    SlotFive()
                }
            }
            SlotOne()
        }
    }
}
