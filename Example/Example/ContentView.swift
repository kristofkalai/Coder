//
//  ContentView.swift
//  Example
//
//  Created by Kristóf Kálai on 2023. 03. 12..
//

import Coder
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear(perform: coderTestMethod)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private func coderTestMethod() {
    struct CodablePage: Codable {
        let text: String
    }

    let coder = Coder()
    let object = CodablePage(text: "Text")
    let encodedObject: Data? = coder.encode(object, type: .json)
    let decodedObject: CodablePage? = coder.decode(encodedObject, type: .json)
    assert(object.text == decodedObject?.text)
}
