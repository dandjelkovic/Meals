//
//  StatisticsCell.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI
import Foundation

struct StatisticsCell: View {
    var day: Day
    private var opacity: Double {
        min(Double(day.meals.count)/10.0, 1)
    }

    var body: some View {
        VStack() {
            Text(self.day.dateString)
            Path(CGRect(x: 0, y: 0, width: 100, height: 10))
                .fill(
                    Color(
                        Color.RGBColorSpace.displayP3,
                        red: 1.0,
                        green: 0.0,
                        blue: 0.0,
                        opacity: opacity
                    )
            )
        }.padding(20)


    }
}

//struct StatisticsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsCell()
//    }
//}
