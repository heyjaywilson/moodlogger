//
//  ContentView.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var logman: LogManager
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            LogList()
                .environmentObject(logman)
                .environment(\.managedObjectContext, context)
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                    }
            }
            .tag(0)
        }
    }
}
