//
//  PokemonDetails.swift
//  Pokidex
//
//  Created by Gaurav Ganju on 27/04/22.
//

import Foundation

struct PokemonDetails: Codable {
    var base_experience: Int
    var height: Int
    var weight: Int
}

class PokemonDetailsApi {
    func getDetails(url: String, completion: @escaping (PokemonDetails) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            let pokemonDetail = try! JSONDecoder().decode(PokemonDetails.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonDetail.self)
            }
        }.resume()
    }

}
