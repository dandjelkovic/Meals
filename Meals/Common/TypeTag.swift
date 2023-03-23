//
//  TypeTag.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 24.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

struct TypeTag: View {
    var type: MealType
    var color: Color = Color.blue

    var body: some View {
        Text(verbatim: self.type.stringValue)
            .font(Font.system(size: 12))
            .foregroundColor(color)
            .padding(2)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(color, lineWidth: 1)
            )
    }
}

struct TypeTag_Previews: PreviewProvider {
    static var previews: some View {
        TypeTag(type: .vegetarian)
    }
}
