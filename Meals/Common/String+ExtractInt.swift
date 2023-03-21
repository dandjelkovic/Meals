//
//  String+ExtractInt.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 13.01.20.
//  Copyright © 2020 Dalibor Andjelkovic. All rights reserved.
//

extension String {
    func extractInt16() -> Int16 {
        let filteredInts = self.replacingOccurrences(
            of: #"[^0-9]"#,
            with: "",
            options: .regularExpression
        )
        return Int16(filteredInts) ?? 0
    }
    func extractInt() -> Int {
        let filteredInts = self.replacingOccurrences(
            of: #"[^0-9]"#,
            with: "",
            options: .regularExpression
        )
        return Int(filteredInts) ?? 0
    }
}
