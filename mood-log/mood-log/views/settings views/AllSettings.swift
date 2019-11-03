//
//  AllSettings.swift
//  mood-log
//
//  Created by Maegan Wilson on 11/1/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct AllSettings: View {
    @Environment(\.managedObjectContext) var context
    var body: some View {
        NavigationView{
            List {
                NavigationLink("Log Row", destination: LogRowSetting())
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct AllSettings_Previews: PreviewProvider {
    static var previews: some View {
        AllSettings()
    }
}
