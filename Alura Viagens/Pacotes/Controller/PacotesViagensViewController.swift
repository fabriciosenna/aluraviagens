//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Fabricio Rodrigo Baixo on 12/28/20.
//  Copyright © 2020 Fabricio Rodrigo Baixo. All rights reserved.
//

import UIKit


class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UISearchBarDelegate,UICollectionViewDelegate {

    // MARK: Outlets

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    // MARK: Constantes e Variáveis
    
    let listaComTodasViagens: Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens:Array<PacoteViagem> = []
    
    
    // MARK: Carregamento de página
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisarViagens.delegate = self
        self.labelContadorPacotes.text = self.atualizaContadorLabel()

    }
    
    // MARK: CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        let pacoteAtual = listaViagens[indexPath.item]
        celulaPacote.configuraCelula(pacoteViagem: pacoteAtual)
        
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-15, height: 160) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    // MARK: SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens
        
        if searchText != ""{
            let filtroListaViagem = NSPredicate(format: "viagem.titulo contains[cd] %@", searchText)
           let listaFiltrada:Array<PacoteViagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array
            listaViagens = listaFiltrada
        }
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
        colecaoPacotesViagem.reloadData()
    }

    func atualizaContadorLabel() -> String {
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }
}
