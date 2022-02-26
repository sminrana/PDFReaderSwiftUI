//
//  PDFReaderSwiftUIApp.swift
//  PDFReaderSwiftUI
//
//  Created by Smin Rana on 2/27/22.
//

import SwiftUI

@main
struct PDFReaderSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
