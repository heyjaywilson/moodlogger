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
    
    var body: some View {
        VStack{
            RowLog(log: LogEntity(context: context))
            ScrollView{
                Text("LARGE TEXT IS HERE. I'm trying something now")
                    .font(.largeTitle)
                Text("LARGE TEXT IS HERE. I'm trying something now")
                    .font(.largeTitle)
                Text("LARGE TEXT IS HERE. I'm trying something now")
                    .font(.largeTitle)
                Text("LARGE TEXT IS HERE. I'm trying something now")
                    .font(.largeTitle)
            }
        }
        .navigationBarTitle("Row Settings", displayMode: .inline)
    }
}

struct LogRowSetting_Previews: PreviewProvider {
    static var previews: some View {
        LogRowSetting()
    }
}
