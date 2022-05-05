//
//  ContentView.swift
//  Pokidex
//
//  Created by Gaurav Ganju on 21/04/22.
//

import SwiftUI

struct ContentView: View {
    @State private var pokemons = [PokemonEntry]()
    @State private var urlimg: [String] = []
    @State var searchText = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(searchText == "" ? pokemons : pokemons.filter( {
                    $0.name.contains(searchText.lowercased())
                })) { pokemon in
                    HStack {
                        PokemonImage(imageLink: "\(pokemon.url)")
                            .padding(.trailing, 20)
                        NavigationLink("\(pokemon.name)".capitalized,
                                       destination: PokemonDetailedView(imglink: pokemon.url, name: pokemon.name))
                        
                    }
                }
                .padding()
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokidex")
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemons = pokemon
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
//    func pokiView(poki: String) {
//        PokemonSelectedApi().getData(url: poki) { url in
//            if let unwrap = url.front_default {
//
//            }
//        }
//    }
//    for poki in pokemons {
//        PokemonSelectedApi().getData(url: poki.url) { url in
//            if let unwrap = url.front_default {
//                urlimg.append(unwrap)
//            }
//        }
//    }
//    func pokemonImage() {
//        for pokemon in pokemons {
//            PokemonSelectedApi().getData(url: pokemon.url ) { url in
//                if let unwrap = url.front_default { // Block unexecuted, as optional password is nil.
//                    urlimg.append(unwrap)
//                    print(unwrap)
//                }
//            }
//        }
//        print(urlimg)
//    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//PokeApi().getData() { pokemon in
//    print(pokemon)
//
//    for pokemon in pokemon {
//        print(pokemon.name)
//    }
//}

//PokemonSelectedApi().getData(url: "https://pokeapi.co/api/v2/pokemon/2/") { url in
//    print(url)
//}
