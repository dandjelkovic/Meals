//
//  DismissingKeyboard.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 13.01.20.
//  Copyright © 2020 Dalibor Andjelkovic. All rights reserved.
//
import SwiftUI

struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                    .filter({ $0.activationState == .foregroundActive })
                    .map({ $0 as? UIWindowScene })
                    .compactMap({ $0 })
                    .first?.windows
                    .filter({ $0.isKeyWindow }).first
                keyWindow?.endEditing(true)
            }
    }
}
