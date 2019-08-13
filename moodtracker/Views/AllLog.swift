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
    @State private var showModal: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.showModal.toggle()
            }) {
                Text("Add Mood")
            }.sheet(isPresented: $showModal) {
                FormMood().environmentObject(self.data)
            }
            
            List(data.logs, id: \.id) { entry in
                AllLogRow(logs: entry)
            }.animation(.default)
        }
    }
}

#if DEBUG
struct AllLog_Previews: PreviewProvider {
    @EnvironmentObject var data: AllData
    static var previews: some View {
        AllLog()
    }
}
#endif
