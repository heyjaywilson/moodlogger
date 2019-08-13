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
            
            NavigationView{
                List(data.logs, id: \.id) { entry in
                    NavigationLink(destination: DetailLog(log: entry)) {
                        AllLogRow(logs: entry)
                    }
                }
                .navigationBarTitle(Text("Logs"))
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea([.top, .bottom])
            }
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
