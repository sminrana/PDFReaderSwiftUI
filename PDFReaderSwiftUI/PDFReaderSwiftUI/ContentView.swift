//
//  ContentView.swift
//  SwiftPDFReader
//
//  Created by Smin Rana on 2/27/22.
//

import SwiftUI
import CoreData
import PDFKit

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        VStack {
            if let url = Bundle.main.url(forResource: "sample", withExtension: ".pdf") {
                PDFViewRepresentable(url: url)
            } else {
                Text("PDF file not found")
            }
        }
        .navigationBarTitle("PDFKit", displayMode: .inline)
    }
}

struct PDFViewRepresentable: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> some UIView {
        let pv = PDFView()
        
        pv.document = PDFDocument(url: url)
        pv.autoScales = true
        pv.displayMode = .singlePageContinuous
        pv.displaysAsBook = true
        pv.isUserInteractionEnabled = true
        pv.backgroundColor = UIColor.gray
        pv.displayDirection = .horizontal
        
        return pv
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> () {
        Cordinator(self)
    }
    
    class Cordinator: NSObject {
        var parent: PDFViewRepresentable
        
        init(_ parent: PDFViewRepresentable) {
            self.parent = parent
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

