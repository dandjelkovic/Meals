//
//  StatisticsCell.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

struct StatisticsCell: View {
    var days: [Day]
    var index: Int
    
    var body: some View {
        if self.days.count > index {
            return Text(self.days[index].dateString)
        } else {
            return Text("No data")
        }
    }
}

//struct StatisticsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsCell()
//    }
//}
