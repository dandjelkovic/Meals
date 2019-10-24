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
        VStack {
            ForEach(0..<days.count, id: \.self) { index in
                StatisticsCell(day: self.days[index])
                .background(((index + 1) % 2) == 0 ? Color.secondary : Color.clear)
            }
        }
    }
}

struct StatisticsRow_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsRow()
    }
}
