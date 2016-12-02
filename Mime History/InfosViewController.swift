//
//  InfosViewController.swift
//  Mimica
//
//  Created by Anderson Oliveira on 17/11/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import UIKit

class InfosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var background: UIView!
    
    var periodos : [Periodo]? = []
    
    
    var sliderEquipes = MBSliderView()
    var sliderTempo = MBSliderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.periodos = PeriodoStore.singleton.pegarPeriodo()
        self.background.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        
        sliderEquipeSettings()
        sliderTempoSettings()
        
        sliderEquipes.frame = CGRect(x: 50, y: 270, width: self.view.frame.size.width - 80, height: 100)
        sliderEquipes.minValue = 2
        sliderEquipes.maxValue = 4
        sliderEquipes.currentValue = 2
        sliderEquipes.step = 1
        sliderEquipes.ignoreDecimals = true  // default value
        sliderEquipes.animateLabel = false   // default value
        self.view.addSubview(sliderEquipes)
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //Slider das Equipes
    func sliderEquipeSettings (){
        
        
        
    }
    
    //Slider Tempo
    func sliderTempoSettings(){
        sliderTempo.frame = CGRect(x: 50, y: 390, width: self.view.frame.size.width - 80, height: 100)
        sliderTempo.minValue = 1
        sliderTempo.maxValue = 3
        sliderTempo.currentValue = 1
        sliderTempo.step = 1
        sliderTempo.ignoreDecimals = true  // default value
        sliderTempo.animateLabel = false   // default value 
        self.view.addSubview(sliderTempo)
    }
    
    //Mark: Collection Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.periodos == nil {
            return 0
        }
        return self.periodos!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlacarCollectionViewCell
        let periodo = self.periodos?[indexPath.item]
        
        periodo?.pontos = 0
        cell.imagem.image = periodo?.avatar
        cell.nome.text = periodo?.nome
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! PlacarCollectionViewCell
        let periodo = self.periodos![indexPath.item]
        
        
        if periodo.pontos == 0 {
            cell.nome.textColor = .red
            cell.imagem.image = periodo.avatarPresented
            periodo.pontos = 1
        }else {
            cell.nome.textColor = .gray
            cell.imagem.image = periodo.avatar
            periodo.pontos = 0
        }
        
        
    }
    
    
    
    //MARK: Segue que manda a quantidade de tempo para responder uma Mímica
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let JogoView = segue.destination as! JogoViewController
        JogoView.timeBase = roundUp(number: sliderTempo.currentValue!)
        
        //MARK: Segue que manda a quantidade de equipe
        let quantidadeEquipe = segue.destination as! JogoViewController
        quantidadeEquipe.quantidadeDeTimes = roundUp(number:sliderEquipes.currentValue!)
    }
    
    func roundUp(number: Float) -> Int {
        let intValue = Int(number)
        
        let dec = number - Float(intValue)
        
        if dec < 0.5 {
            return intValue
        }else{
            return intValue + 1
        }
        
    }
    
    
}

