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
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            LogList()
                .environment(\.managedObjectContext, context)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("First")
                    }
            }
            .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
            }
            .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
