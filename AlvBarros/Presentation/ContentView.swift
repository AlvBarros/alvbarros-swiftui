//
//  ContentView.swift
//  AlvBarros
//
//  Created by Alvaro Barros on 2023-04-29.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    private var tabs:[String: AnyView] = [
        "Repositories": AnyView(RepositoryListView()),
        "Articles": AnyView(ArticlesListView())
    ]
    @State private var selectedTab: String = "Repositories"
    
    @State private var scrollOffset: CGPoint = .zero
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    Section {
                        ProfileCard()
                    }
                    Picker("Tabs", selection: $selectedTab) {
                        ForEach(tabs.keys.sorted(by: >), id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    tabs[selectedTab].frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
                    .readingScrollView(from: "scroll", into: $scrollOffset)
                }
                .navigationBarTitle(scrollOffset.y > .zero ? selectedTab : "", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink("About") {
                            AboutView()
                        }
                    }
                }
            }
            .background(Color(.systemGray5))
        }
        .environmentObject(userViewModel)

    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(
            UserViewModel(isAuthenticated: true,
                          username: "AlvBarros",
                          email: "alv.barrosc@hotmail.com",
                          imageUrl: "teste")
        )
    }
}
#endif
