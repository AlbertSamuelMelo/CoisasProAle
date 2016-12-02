//
//  Periodo.swift
//  Mime History
//
//  Created by Anderson Oliveira on 02/12/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import UIKit

class Periodo: NSObject {

    var avatar: UIImage?
    var nome: String?
    var pontos: Int?
    var avatarPresented: UIImage?
    
    
    //Mostra descrição detalhada quando for solicitado
    override var description: String {
        get{ return "\(self.nome),\(self.pontos)," }
        
    }
}
