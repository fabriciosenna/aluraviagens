//
//  DetalhesViagensViewController.swift
//  Alura Viagens
//
//  Created by Fabricio Rodrigo Baixo on 12/30/20.
//  Copyright © 2020 Fabricio Rodrigo Baixo. All rights reserved.
//

import UIKit

class DetalhesViagensViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    
    // MARK: Constantes e Variáveis
    
    var pacoteSelecionado:PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let pacote = pacoteSelecionado else {return print("Erro ao buscar informações sobre o pacoteViagens(classe: DetalhesViagensViewController)")}
        
        self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
        self.labelTituloPacoteViagem.text = pacote.viagem.titulo
        self.labelDescricaoPacoteViagem.text = pacote.descricao
        self.labelDataViagem.text = pacote.dataViagem
        self.labelPrecoPacoteViagem.text = pacote.viagem.preco
    }
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
