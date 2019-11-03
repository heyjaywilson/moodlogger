//
//  LogRowSetting.swift
//  mood-log
//
//  Created by Maegan Wilson on 11/1/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct LogRowSetting: View {
    @Environment(\.managedObjectContext) var context
    @State private var slot1Select: Int = 0
    
    var body: some View {
        List{
            RowLog(log: LogEntity(context: context))
            Picker(selection: $slot1Select, label: Text("Slot 1")) {
                Text("Activity Summary").tag(0)
                Text("Water Intake").tag(1)
            }.pickerStyle(WheelPickerStyle())
            Text("Slot 2")
            Text("Slot 3")
            Text("Slot 4")
            Text("Slot 5")
        }
        .navigationBarTitle("Row Settings", displayMode: .inline)
    }
}

struct LogRowSetting_Previews: PreviewProvider {
    static var previews: some View {
        LogRowSetting()
    }
}
