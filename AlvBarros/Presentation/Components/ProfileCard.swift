//
//  ProfileCard.swift
//  AlvBarros
//
//  Created by Alvaro Barros on 2023-04-29.
//

import SwiftUI

struct ProfileCard: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        self.content
    }
    
    @ViewBuilder private var content: some View {
        if userViewModel.isAuthenticated {
            authenticatedView
        } else {
            notAuthenticatedView
        }
    }
    
    private var authenticatedView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
            HStack {
                Image("github-mark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                VStack {
                    Text("You're authenticated!")
                }
            }
            .layoutPriority(1)
            .frame(
                maxWidth: .infinity,
                maxHeight: 120
            )
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: 120
        )
    }
    
    private var notAuthenticatedView: some View {
        Text("You're not authenticated!")
    }
}

#if DEBUG
struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.systemGray5)
            ProfileCard().environmentObject(
                UserViewModel(isAuthenticated: true,
                              username: "AlvBarros",
                              email: "alv.barrosc@hotmail.com",
                              imageUrl: "teste")
            )
            .padding()
        }
    }
}
#endif
