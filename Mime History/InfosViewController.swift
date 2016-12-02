//
//  InfosViewController.swift
//  Mimica
//
//  Created by Anderson Oliveira on 17/11/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import UIKit

class InfosViewController: UIViewController {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var smiler: UIImageView!
    @IBOutlet weak var smilerampu: UIImageView!
    
    var sliderEquipes = MBSliderView()
    var sliderTempo = MBSliderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        sliderEquipes.delegate = self
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
        sliderTempo.delegate = self
        self.view.addSubview(sliderTempo)
    }
    
    
    /*
     
     //MARK: Segue que manda os Períodos - Ainda tem que ver como será usada
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
     let periodoSelecionado = segue.destination as! JogoViewController
     
     }
    
     
   
    //MARK: Segue que manda a quantidade de equipe
     override func prepareEquipes(for segue: UIStoryboardSegue, sender: Any?) {
        let quantidadeEquipe = segue.destination as! JogoViewController
        quantidadeEquipe.quantidadeDeTimes = roundUp(number:sliderEquipes.currentValue!)
     
     }
     
   */
 
    
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


extension InfosViewController: MBSliderDelegate {
    func sliderView(_ sliderView: MBSliderView, valueDidChange value: Float) {
        let intValue = roundUp(number: value)

        if sliderView == sliderEquipes {
            if intValue == 2 {
                self.smiler.image = UIImage(named: "mime1")
            }else if intValue == 3 {
                self.smiler.image = UIImage(named: "mime2")
            }else if intValue == 4   {
                self.smiler.image = UIImage(named: "mime3")
            }else{}
            
        } else if sliderView == sliderTempo {
            if intValue == 1 {
                self.smilerampu.image = UIImage(named: "ampu")
            }else if intValue == 2 {
                self.smilerampu.image = UIImage(named: "ampu2")
            }else if intValue == 3 {
                self.smilerampu.image = UIImage(named: "ampu3")
            }else{}
            
        }
    }
}

