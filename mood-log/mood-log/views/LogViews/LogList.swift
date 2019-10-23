//
//  LogList.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct LogList: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var logman: LogManager
    @FetchRequest(
        entity: LogEntity.entity(),
        sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]
    ) var logs: FetchedResults<LogEntity>
    @State private var showNewLogForm: Bool = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(logman.allLogs){ log in
                    NavigationLink(destination: LogDetails(log: log)) {
                        LogRow(log: log)
                    }
                }
            }
            .navigationBarTitle("Log")
            .navigationBarItems(trailing: Button(action: {
                self.showNewLogForm = true
            }){
                Text("Add Log")
            }.sheet(isPresented: $showNewLogForm, content: {
                NewLog().environmentObject(self.logman)
            })
            )
            .animation(.linear(duration: 0.5))
        }
    }
}

struct LogList_Previews: PreviewProvider {
    static var previews: some View {
        LogList()
    }
}
