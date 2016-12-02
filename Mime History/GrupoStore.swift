//
//  GrupoStore.swift
//  Mimica
//
//  Created by David Camurça on 22/11/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import UIKit

class GrupoStore {
    
    static let singleton = GrupoStore()
    
    
    let datagrupos: [(String, Int, Int, UIImage)] = [
        
       //   Nome        Pontos     id          imagem
        ("Legionários",   0,      0,    #imageLiteral(resourceName: "romaAntiga")),
        
        ("Beserkers",     0,      1,    #imageLiteral(resourceName: "beserkers")),
        
        ("Espartanos",    0,      2,    #imageLiteral(resourceName: "espartanos")),
        
        ("Cruzados",      0,      3,    #imageLiteral(resourceName: "cruzados"))
    ]
    
    //MARK: Pega grupos
    func pegarGrupo(_ value: Int)-> [Grupo] {
        
        var grupos = [Grupo]()
        
        for i in 0...value {
            
            let grupo = Grupo()

            grupo.nome = datagrupos[i].0
            grupo.pontos = datagrupos[i].1
            grupo.id = datagrupos[i].2
            grupo.avatar = datagrupos[i].3
        
            grupos.append(grupo)
        }
        return grupos
    }

    
}
