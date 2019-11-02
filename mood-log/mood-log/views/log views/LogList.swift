//
//  LogList.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/10/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct LogList: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var logman: LogManager
    @State private var showNewLogForm: Bool = false
    
    var body: some View {
        NavigationView{
            List {
                ForEach(logman.allLogs) { log in
                    RowLog(log: log)
                }
            }
            .navigationBarTitle("Logs")
            .navigationBarItems(trailing: Button(action: {
                self.showNewLogForm = true
            }){
                Text("Add Log")
            }.sheet(isPresented: $showNewLogForm, content: {
                LogNew().environmentObject(self.logman)
            })
            )
        }
    }
}

struct LogList_Previews: PreviewProvider {
    static var previews: some View {
        LogList()
    }
}
