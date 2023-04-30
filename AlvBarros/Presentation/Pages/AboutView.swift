//
//  AboutView.swift
//  AlvBarros
//
//  Created by Alvaro Barros on 2023-04-29.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("Hello, world!").font(.title)
            AsyncImage(url: URL(string:"https://avatars.githubusercontent.com/u/33898913")) { image in
                image.resizable().aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            Text("Hi, I'm Alvaro Barros, a software developer with a focus on mobile development. With a strong passion for creating innovative solutions, I specialize in the latest technologies such as Flutter, SwiftUI, and Kotlin. My experience in the financial industry and web development has provided me with a diverse skillset, allowing me to approach problems from different angles and deliver comprehensive solutions. I'm excited to tackle new challenges and create amazing mobile applications that exceed your expectations.")
                .multilineTextAlignment(.center)
            Text("This text was written by AI, but it's still true.").font(.caption)
            Spacer()
            Link(destination: URL(string: "https://github.com/AlvBarros")!) {
                Image("github-mark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
        }.padding(16)
    }
}
