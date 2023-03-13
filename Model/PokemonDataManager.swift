//
//  PokemonDataManager.swift
//  practica1modulo4
//
//  Created by Jesús Enrique Castro on 07/03/23.
//

import Foundation

class PokemonDataManager{
    
    private var pokemons: [Pokemon] = []
    
    private func loadData() -> [[String:String]]{
        let decoder = PropertyListDecoder()
        if let path = Bundle.main.path(forResource: "Pokemonplist", ofType: "plist"),
           let pokemonData = FileManager.default.contents(atPath: path),
           let pokemons = try? decoder.decode([[String:String]].self, from: pokemonData){
            return pokemons
        }
        return [[:]]
    }
    
    func fetch(){
        for pokemonInfo in loadData(){
            pokemons.append(Pokemon.init(dict:pokemonInfo))
        }
    }
    
    func pokemonCount() -> Int {
        pokemons.count
    }
    
    func pokemonAtIndex(index:Int) -> Pokemon{
        return pokemons[index]
    }
}
