//
//  HostingController.swift
//  TrackOnWatch Extension
//
//  Created by Dalibor Andjelkovic on 05.12.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI
import CoreData

class HostingController: WKHostingController<ContentView> {
    // MARK: - Core Data stack
    override var body: ContentView {
//        let contentView = ContentView().environment(\.managedObjectContext, context)
        return ContentView()
    }
}
