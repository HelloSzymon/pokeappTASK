//
//  PokeModel.swift
//  pokeappTASK
//
//  Created by Szymon Wnuk on 15/07/2022.
//

import Foundation

// JSON https://pokeapi.co/api/v2/pokemon/?offset=0&limit=1154
//"results": [
//{
//"name": "bulbasaur",
//"url": "https://pokeapi.co/api/v2/pokemon/1/"


// 1. Structs for JSON data
struct PokeModel : Codable{
    var results: [PokemonResults]
}

struct PokemonResults : Codable, Identifiable  {
    let id = UUID()
    var name: String
    var url: String
}

// 2. Class with URL
class PokemonApi  {
    func getData(completion:@escaping ([PokemonResults]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=1154") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(PokeModel.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
        }.resume()
        
    }
}
