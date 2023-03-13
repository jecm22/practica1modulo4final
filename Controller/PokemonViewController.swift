//
//  PokemonViewController.swift
//  practica1modulo4
//
//  Created by Jesús Enrique Castro on 07/03/23.
//

import UIKit

class PokemonViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
   
    let manager = PokemonDataManager()
    var selectedPokemon : Pokemon?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return manager.pokemonCount()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellPokemon", for: indexPath) as! CollectionViewCell
                
                let pokemon = manager.pokemonAtIndex(index: indexPath.row)
                cell.ImageViewPokemon.image = UIImage.init(named: pokemon.image)
                cell.LabelPokemon.text = pokemon.name
                
                return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Titulo", for: indexPath)
        
            
            return header
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            selectedPokemon = manager.pokemonAtIndex(index: indexPath.row)
            self.performSegue(withIdentifier: "especificaciones", sender: Self.self)
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destination = segue.destination as! DetailViewController
            destination.Pokemonselected = selectedPokemon
        }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        manager.fetch()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var CollectionViewPokemon: UICollectionView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
