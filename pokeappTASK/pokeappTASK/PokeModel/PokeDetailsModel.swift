//
//  PokeDetailsModel.swift
//  pokeappTASK
//
//  Created by Szymon Wnuk on 15/07/2022.
//

import Foundation

struct PokemonDetails: Codable {
        var sprites: PokeSprites
        var weight: Int
    }

    struct PokeSprites : Codable {
        var front_default: String?
    }

    class PokeSelectedAPI  {
        func getSprite(url: String, completion:@escaping (PokeSprites) -> ()) {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                
                let pokemonSprite = try! JSONDecoder().decode(PokemonDetails.self, from: data)
                
                DispatchQueue.main.async {
                    completion(pokemonSprite.sprites)
                }
            }.resume()
        }
    }
