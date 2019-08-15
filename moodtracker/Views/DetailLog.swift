
//
//  DetailLog.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/13/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct DetailLog: View {
    var log: LogDay
    var body: some View {
        ScrollView {
            MoodLarge(moods: log.moods)
            MoveLarge()
        }
        .navigationBarTitle(Text(log.date))
    }
}

#if DEBUG
struct DetailLog_Previews: PreviewProvider {
    static var previews: some View {
        DetailLog(log: LogDay(id: 1, moods: [], notes: [], date: "2019-08-1"))
    }
}
#endif
