//
//  RowLog.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/30/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct RowLog: View {
    var body: some View {
        HStack{
            DateRow()
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

struct RowLog_Previews: PreviewProvider {
    static var previews: some View {
        RowLog()
    }
}
