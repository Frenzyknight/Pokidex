//
//  PokemonSelected.swift
//  Pokidex
//
//  Created by Gaurav Ganju on 21/04/22.
//

import Foundation

struct PokemonSelected: Codable {
    var sprites: PokemonSprites
}

struct PokemonSprites: Codable {
    var front_default: String?
}


class PokemonSelectedApi {
    func getData(url: String, completion: @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
        }.resume()
    }
}
