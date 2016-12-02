//
//  ComplicationStore.swift
//  Mime History
//
//  Created by David Camurça on 02/12/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import Foundation

class Dataa {

    class pegaGanhador {
    
        let equipe: String
        let startDate: Date
        
        let noewDate = Date()
        
        init(equipe: String, delta: Int) {
            self.equipe = equipe
            
            let timeInterval: TimeInterval = Double(delta * 60)
            self.startDate = Date(timeInterval: timeInterval, since: Date())
        }
        
        let test = [
            pegaGanhador(equipe: "Legionarios", delta: 10),
            pegaGanhador(equipe: "Roma", delta: 40)
        ]
    }
}
