//
//  Settings.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 05.11.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var actionSheetPresented = false
    @State var exportSheetPresented = false

    var exportURL: URL? = FileExporter().exportDatabase()
    let exporter = FileExporter()

    var body: some View {
        Button( action: {
            self.actionSheetPresented = true
        }) {
            Text("Backup as CSV file").bold().padding(20).border(Color.secondary)
        }.sheet(isPresented: $actionSheetPresented, content: {
            ActivityViewController(items: [self.exportURL as Any])
        })
    }
}

struct Export_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
