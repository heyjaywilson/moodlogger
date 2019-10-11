//
//  SingleHealthInfo.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/10/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct SingleHealthInfo: View {
    var label: String
    var amt: String
    var body: some View {
        HStack{
            Text(label)
            Spacer()
            Text(amt)
        }
    }
}

struct SingleHealthInfo_Previews: PreviewProvider {
    static var previews: some View {
        SingleHealthInfo(label: "Weight", amt: "212 lbs")
    }
}
