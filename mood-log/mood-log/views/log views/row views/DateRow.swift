//
//  DateRow.swift
//  mood-log
//
//  Created by Maegan Wilson on 11/1/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct DateRow: View {
    var month: String
    var day: String
    var body: some View {
        VStack{
            Text(month)
                .font(.headline)
            Text(day)
        }
        .frame(width: 60, alignment: .center)
    }
}

struct DateRow_Previews: PreviewProvider {
    static var previews: some View {
        DateRow(month: "Dec", day: "12")
    }
}
