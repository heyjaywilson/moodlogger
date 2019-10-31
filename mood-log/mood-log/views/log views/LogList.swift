//
//  LogList.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/10/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct LogList: View {
    var body: some View {
        List {
            RowLog()
        }
    }
}

struct LogList_Previews: PreviewProvider {
    static var previews: some View {
        LogList()
    }
}
