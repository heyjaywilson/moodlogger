//
//  AllLog.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct AllLog: View {
    var body: some View {
        List {
            AllLogRow()
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
