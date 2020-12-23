//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Fabricio Rodrigo Baixo on 12/23/20.
//  Copyright © 2020 Fabricio Rodrigo Baixo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tabelaViagens: UITableView!
    let listaViagem: [String] = ["Rio de Janeiro", "Uberlândia", "São Paulo", "Florianópolis"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listaViagem[indexPath.row]
        
        return cell
    }
    



}

