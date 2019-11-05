//
//  ActivityViewController.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 05.11.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import UIKit
import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
    var items: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        //
    }
}
