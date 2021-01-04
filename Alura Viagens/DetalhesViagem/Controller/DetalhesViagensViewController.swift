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
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    
    @IBOutlet weak var textFieldData: UITextField!
    // MARK: Constantes e Variáveis
    
    var pacoteSelecionado:PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        guard let pacote = pacoteSelecionado else {return print("Erro ao buscar informações sobre o pacoteViagens(classe: DetalhesViagensViewController)")}
        
        self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
        self.labelTituloPacoteViagem.text = pacote.viagem.titulo
        self.labelDescricaoPacoteViagem.text = pacote.descricao
        self.labelDataViagem.text = pacote.dataViagem
        self.labelPrecoPacoteViagem.text = pacote.viagem.preco
    }
    
    @objc func exibeDataTextField(sender: UIDatePicker){
        let formatador = DateFormatter()
        formatador.dateFormat = "dd MM yyyy"
        self.textFieldData.text = formatador.string(from: sender.date)
    }
    
    @objc func aumentarScroll(notification:Notification){
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
    }
    
    // MARK: IBAction
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func textFieldEntrouFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
    }
    
    @IBAction func botaoFinalizarCompra(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        controller.pacoteComprado = pacoteSelecionado
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
