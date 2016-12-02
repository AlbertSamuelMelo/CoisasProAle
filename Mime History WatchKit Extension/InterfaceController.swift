//
//  InterfaceController.swift
//  Mime History WatchKit Extension
//
//  Created by Anderson Oliveira on 01/12/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController {

    let datagrupos: [(String, Int)] = [("Legionários", 0),("Beserkers", 1), ("Espartanos",2), ("Cruzados",3)]
    
    
    var session: WCSession?{
        didSet{
            if let session = session{
                session.delegate = self
                session.activate()
            }
        }
    }
    
    var equip = ""
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        session = WCSession.default()

    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func Acerto() {
        
        //envia dic e recebe dic
        session!.sendMessage(["comando":"Acertou"], replyHandler: { (response: [String : Any]) in
            //print("\nMandei a mensagem\n")
            
            if let newValue = response["Acerto"] as? String{
                print("Acerto enviado watchOS")
                print(newValue)
            }
            
        })
        {(Error) in
            print("Deu erro no InterfaceController")
        }
        
    }
    
    
    
}

extension InterfaceController: WCSessionDelegate{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("watchOP: Session Ativado.")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("Recive iOS mensager")
        
        if message["comando"] as? String == "Legionários"{
            
            equip = "Legionários"
            
            //_ = ComplicationController().vencedor = "Legionários"
            
            print("Chegou a equipe Legionarios")
            let response = ["Time":"Legionários"]
            replyHandler(response)
        }else if message["comando"] as? String == "Beserkers"{
            
            equip = "Beserkers"
            
           // _ = ComplicationController().vencedor = "Beserkers"
            
            print("Chegou a equipe Beserkers")
            let response = ["Time":"Beserkers"]
            replyHandler(response)
        }else if message["comando"] as? String == "Espartanos"{
            
            equip = "Espartanos"
            
            
          //  _ = ComplicationController().vencedor = "Espartanos"
            print("Chegou a equipe Espartanos")
            let response = ["Time":"Espartanos"]
            replyHandler(response)
        }else if message["comando"] as? String == "Cruzados"{
            
            equip = "Cruzados"
            
         //   _ = ComplicationController().vencedor = "Cruzados"
            
            print("Chegou a equipe Cruzados")
            let response = ["Time":"Cruzados"]
            replyHandler(response)
        }
        
        
        
        
    }
    
}
