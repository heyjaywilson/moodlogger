//
//  SleepSmall.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct SleepSmall: View {
    var amountSleep: Double
    var body: some View {
        HStack {
            Text("💤")
            Text("\(amountSleep)")
        }
    }
}

#if DEBUG
struct SleepSmall_Previews: PreviewProvider {
    static var previews: some View {
        SleepSmall(amountSleep: 8.4)
    }
}
#endif
