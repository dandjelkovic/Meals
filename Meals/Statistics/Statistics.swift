//
//  Statistics.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI
import Foundation

struct Statistics: View {
    var days = [Day]()
    var body: some View {
        List {
            ForEach(self.days, id: \.self) { day in
                StatisticsCell(day: day)
            }
        }
    }
}

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics()
    }
}
