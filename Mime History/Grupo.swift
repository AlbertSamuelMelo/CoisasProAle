//
//  Grupo.swift
//  Mimica
//
//  Created by David Camurça on 22/11/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import UIKit

class Grupo: NSObject {
    
    var avatar: UIImage?
    var nome: String?
    var pontos: Int?
    var id: Int?
    
    //Add Pontos
    func addPontos (){
        
        if var pontos = self.pontos {
            pontos += 1
            self.pontos = pontos
        }
    }
    
    //Mostra descrição detalhada quando for solicitado
    override var description: String {
        get{ return "\(self.nome),\(self.pontos)," }
        
    }
    
}
