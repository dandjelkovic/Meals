//
//  CircleBackground.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 24.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

struct CircleBackground: View {
    var body: some View {
        Circle()
            .fill(Color(UIColor.systemGray5))
            .frame(width: 100, height: 100)
    }
}
