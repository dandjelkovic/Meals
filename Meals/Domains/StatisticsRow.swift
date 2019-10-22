//
//  StatisticsRow.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

struct StatisticsRow: View {
    var days = [Day]()

    var body: some View {
        ForEach(0...days.count, id: \.self) { index in
            StatisticsCell(days: self.days, index: index)
        }
    }
}

struct StatisticsRow_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsRow()
    }
}
