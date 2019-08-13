//
//  StandSmall.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct StandSmall: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color(hue: 0.52777, saturation: 0.99, brightness: 1.0))
            .frame(minWidth: 10, maxWidth: 80, minHeight: 20, maxHeight: 20)
    }
}

#if DEBUG
struct StandSmall_Previews: PreviewProvider {
    static var previews: some View {
        StandSmall()
    }
}
#endif
