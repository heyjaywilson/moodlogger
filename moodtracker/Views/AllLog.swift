//
//  AllLog.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct AllLog: View {
    @ObservedObject var data: SampleUserData = SampleUserData()
    
    var body: some View {
        List {
            AllLogRow(mood: data.sampleData[0])
        }
    }
}

#if DEBUG
struct AllLog_Previews: PreviewProvider {
    static var previews: some View {
        AllLog()
    }
}
#endif
