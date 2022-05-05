//
//  PokemonDetailedView.swift
//  Pokidex
//
//  Created by Gaurav Ganju on 27/04/22.
//

import SwiftUI

struct PokemonDetailedView: View {
    var imglink = ""
    var name = ""
    @State private var weight = 0
    @State private var height = 0
    @State private var base_experience = 0
    var body: some View {
        VStack {
            Spacer()
            PokemonImage(imageLink: imglink, imageSize: 200)
                .padding()
            VStack {
                Text("Name: \(name)".capitalized)
                    .padding(1)
                Text("Height: \(height)")
                    .padding(1)
                Text("Weight: \(weight)")
                    .padding(1)
                Text("Base Experience: \(base_experience)")
                    .padding(1)
            }
            Spacer()
            Spacer()
        }
        .onAppear {
            getPokemonDetails(url: imglink)
        }
    }
    func getPokemonDetails(url: String) {
        PokemonDetailsApi().getDetails(url: url) { detail in
            self.weight = detail.weight
            self.height = detail.height
            self.base_experience = detail.base_experience
            
        }
    }

}

struct PokemonDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailedView()
    }
}

