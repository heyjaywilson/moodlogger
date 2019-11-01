//
//  DateRow.swift
//  mood-log
//
//  Created by Maegan Wilson on 11/1/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct DateRow: View {
    var body: some View {
        VStack{
            Text("Nov")
                .font(.headline)
            Text("1")
        }
        .frame(width: 60, alignment: .center)
    }
}

struct DateRow_Previews: PreviewProvider {
    static var previews: some View {
        DateRow()
    }
}
