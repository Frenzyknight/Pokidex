//
//  PokemonImage.swift
//  Pokidex
//
//  Created by Gaurav Ganju on 27/04/22.
//

import SwiftUI

struct PokemonImage: View {
    var imageLink = ""
    var imageSize: CGFloat = 100
    @State private var pokemonSprite = ""
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite))
            .frame(width: imageSize, height: imageSize)
            .onAppear {
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadedData == nil {
                    getSprite(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                    print("New url caching...")
                }
                else {
                    getSprite(url: loadedData ?? "placeholder")
                    print("Using cached data")
                }
            }
            .clipShape(Circle())
            .foregroundColor(.blue)
    }
    func getSprite(url: String) {
        PokemonSelectedApi().getData(url: url) { sprite in
            self.pokemonSprite = sprite.front_default ?? "placeholder"
        }
    } 
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage()
    }
}
