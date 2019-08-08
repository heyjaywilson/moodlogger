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
            MonthDate(month: "Aug", day: "01")
            VStack{
                MoodSmall(moods:["🙁","😐", "🙂"])
            }
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
