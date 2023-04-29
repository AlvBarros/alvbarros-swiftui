//
//  ContentView.swift
//  AlvBarros
//
//  Created by Alvaro Barros on 2023-04-29.
//

import SwiftUI

struct ContentView: View {
    @State private var presentedNumbers = [1, 4, 8]
    var body: some View {
        NavigationStack {
            AboutView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
