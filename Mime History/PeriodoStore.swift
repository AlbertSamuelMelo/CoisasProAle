//
//  PeriodoStore.swift
//  Mime History
//
//  Created by Anderson Oliveira on 02/12/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import UIKit

class PeriodoStore: NSObject {

    static let singleton = PeriodoStore()
    
    let dataPeriodos: [(String, Int, UIImage, UIImage)] = [
        
        //   Nome        Pontos     id          imagem
        ("Grécia Antiga",   0,      #imageLiteral(resourceName: "greciaAntigaPt"),    #imageLiteral(resourceName: "greciaAntigaPt")),
        
        ("Egito Antigo",     0,         #imageLiteral(resourceName: "egitoAntigo"),    #imageLiteral(resourceName: "egitoAntigoPt")),
        
        ("Roma Antiga",    0,      #imageLiteral(resourceName: "romaAntiga"),    #imageLiteral(resourceName: "romaAntigaPt")),
        
        ]
    
    //MARK: Pega grupos
    func pegarPeriodo()-> [Periodo] {
        
        var periodos = [Periodo]()
        
        for dataPeriodo in self.dataPeriodos {
            
            let periodo = Periodo()
            
            periodo.nome = dataPeriodo.0
            periodo.pontos = dataPeriodo.1
            periodo.avatarPresented = dataPeriodo.2
            periodo.avatar = dataPeriodo.3
            
            periodos.append(periodo)
        }
        return periodos
    }
    
    

}
