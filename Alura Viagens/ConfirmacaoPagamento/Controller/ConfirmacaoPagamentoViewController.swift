//
//  ConfirmacaoPagamentoViewController.swift
//  Alura Viagens
//
//  Created by Fabricio Rodrigo Baixo on 1/4/21.
//  Copyright © 2021 Fabricio Rodrigo Baixo. All rights reserved.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {

    
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    
    var pacoteComprado:PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacoteComprado {
            print(pacote.viagem.titulo)
        }
        // Do any additional setup after loading the view.
    }
    

}
