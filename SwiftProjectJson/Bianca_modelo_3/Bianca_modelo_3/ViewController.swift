//
//  ViewController.swift
//  Bianca_RM84230_modelo_3
//
//  Created by Usuário Convidado on 17/10/23.
//

import UIKit

var nave:Nave!=nil

class ViewController: UIViewController {


    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var txt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func exibir(_ sender: Any) {
        loadNave()
    }
    
    func loadNave(){
        let jsonUrlString = "https://swapi.dev/api/starships/" + txt.text!
        let url = URL(string: jsonUrlString)
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else {return}
            
            do{
                nave = try JSONDecoder().decode(Nave.self, from: data)
                //print(comic.title)
                //print(comic.img)
                DispatchQueue.main.sync {
                    self.name.text = nave.name
                    self.model.text = nave.model
                    self.manufacturer.text = nave.manufacturer
                }
                

            }catch let jsonError{
                print("Erro da serialização do json", jsonError)
            }
        }
        .resume()
    }
    
}

