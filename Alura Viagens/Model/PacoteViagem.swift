//
//  PacoteViagem.swift
//  Alura Viagens
//
//  Created by Fabricio Rodrigo Baixo on 12/30/20.
//  Copyright © 2020 Fabricio Rodrigo Baixo. All rights reserved.
//

import UIKit

class PacoteViagem: NSObject {
    
    // MARK: Constantes e Variáveis
    
    let nomeDoHotel:String
    let descricao:String
    let dataViagem:String
    @objc let viagem:Viagem
    
    init(nomeDoHotel:String,descricao:String,dataViagem:String,viagem:Viagem) {
        self.nomeDoHotel = nomeDoHotel
        self.descricao = descricao
        self.dataViagem = dataViagem
        self.viagem = viagem  
    }

}
