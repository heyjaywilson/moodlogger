//
//  SettingsView.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/23/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Information Displayed in Log Row")) {
                    Text("Information Displayed in Log Row")
                }
                NavigationLink(destination: Text("Information Displayed in Log Details ")) {
                    Text("Information Displayed in Log Details ")
                }
                Text("About")
                Text("App Website (🔗 to website)")
            }
        .navigationBarTitle(Text("Settings"))
        }
    }
}
