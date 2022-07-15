//
//  ContentView.swift
//  pokeappTASK
//
//  Created by Szymon Wnuk on 15/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonResults]()
       @State var searchText = ""
    @State var Pushed = false
       
       
       var body: some View {
           VStack {
               
           NavigationView {
               
               List {
                   ForEach(searchText == "" ? pokemon: pokemon.filter( {$0.name.contains(searchText.lowercased())} )) {
                       entry in
                       
                       HStack {
                           PokeImage(imageLink: "\(entry.url)")
                               .padding(.trailing, 20)
                           
                           NavigationLink("\(entry.name)".capitalized ,destination: Text("Detail view for \(entry.name)"))
                           
                           Image(Pushed ? "starSolid" :"starRegular").resizable().frame(width: 22.5, height: 20, alignment: .center)
                           .padding(.trailing)
                       }
                   }
               }
               
               .onAppear {
                   PokemonApi().getData() { pokemon in
                       self.pokemon = pokemon
                   }
               }
               .searchable(text: $searchText)
               .navigationTitle("My Pokemons")
           }
       }
   }

   struct ContentView_Previews: PreviewProvider {
       static var previews: some View {
           ContentView()
       }
   }
}
