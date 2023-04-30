//
//  RepositoriesView.swift
//  AlvBarros
//
//  Created by Alvaro Barros on 2023-04-29.
//

import SwiftUI
import Combine

struct RepositoryListView: View {
//    @State private var repos: Loadable<LazyList<String>>
    
//    init(repos: Loadable<LazyList<String>> = .notRequested) {
//        print()
//    }
    
    var body: some View {
        Text("Repository List")
            .padding()
    }
}

#if DEBUG
struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView() // TODO Add mock repository list
    }
}
#endif
