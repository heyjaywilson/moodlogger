//
//  AllLogRow.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct AllLogRow: View {
    var body: some View {
        HStack {
            MonthDate(month: "Aug", day: "\(1)")
            VStack(alignment: .leading){
                MoodSmall(moods:["🙁","😐", "🙂", "😃", "👍","🙁","😐","🙁","😐"])
                SleepSmall(amountSleep: 8.4)
            }.padding(.leading)
            VStack(alignment: .leading) {
                MoveSmall()
                ExerciseSmall()
                StandSmall()
            }.padding(.leading)
        }
    }
}
#if DEBUG
struct AllLogRow_Previews: PreviewProvider {
    static var previews: some View {
        AllLogRow()
    }
}
#endif
