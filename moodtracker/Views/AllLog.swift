//
//  AllLog.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct AllLog: View {
    @EnvironmentObject var data: AllData
    
    var body: some View {
        VStack {
            Button(action: {
                self.data.add(mood: Mood(mood: "😃", date_logged: Date()))
            }) {
                Text("Add Mood")
            }
            List(data.logs, id: \.id) { entry in
                AllLogRow(logs: entry).onAppear {
                    print(entry.id)
                }
            }
        }
    }
}

#if DEBUG
struct AllLog_Previews: PreviewProvider {
    static var previews: some View {
        AllLog()
    }
}
#endif
