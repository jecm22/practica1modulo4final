//
//  DetailViewController.swift
//  practica1modulo4
//
//  Created by Jesús Enrique Castro on 07/03/23.
//

import UIKit

class DetailViewController: UIViewController {

    var Pokemonselected : Pokemon?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombre.text=Pokemonselected?.name
        movimiento.text = Pokemonselected?.move
                habilidad.text = Pokemonselected?.ability
                peso.text = Pokemonselected?.weight
                
        imagendepokemon.image = UIImage.init(named: Pokemonselected!.image)
                imagendepokemon.layer.cornerRadius = 20.0
        imagendepokemon.layer.shadowColor = UIColor.black.cgColor
        imagendepokemon.layer.shadowOpacity = 1
        imagendepokemon.layer.shadowOffset = .zero
        imagendepokemon.layer.shadowRadius = 5
                
              

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var imagendepokemon: UIImageView!
    @IBOutlet weak var peso: UILabel!
    @IBOutlet weak var habilidad: UILabel!
    @IBOutlet weak var movimiento: UILabel!
    
    @IBOutlet weak var nombre: UILabel!
    
}
