//
//  JogoViewController.swift
//  Mimica
//
//  Created by Anderson Oliveira on 17/11/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import UIKit
import Wallet
import WatchConnectivity

class JogoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var session: WCSession?{
        didSet{
            if let session = session{
                session.delegate = self
                session.activate()
            }
        }
    }
    
    
    @IBOutlet weak var imagemTurnoAtual: UIImageView!
    @IBOutlet weak var voltar: UIButton!
    @IBOutlet weak var walletHeaderView: UIView!
    @IBOutlet weak var walletView: WalletView!
    @IBOutlet weak var viewPlacar: UIView!
    @IBOutlet weak var placarCV: UICollectionView!
    
    var grupos: [Grupo]? = []
    var timeAtual = 0
    
    
    var hour = 0
    var min = 0
    var seg = 0
    
    
    var cards : [Card]?
    
    //Hint: Passe algum intervalo de tempo pro Cronometro Regressivo
    var timerCronometro = Timer()
    var Cronometro = 0
    
    var timeBase: Int?
    
    
    //MARK: - Variáveis auxiliares das segues vinda da tela de Infos
    
    var quantidadeDeTimes: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if WCSession.isSupported(){
            session = WCSession.default()
        }
        
        self.grupos = GrupoStore.singleton.pegarGrupo(self.quantidadeDeTimes!-1)
        
        
        self.viewPlacar.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        self.viewPlacar.layer.shadowOpacity = 0.5
        self.cards = CardStore.singleton.getDeck()
        
        walletView.walletHeader = walletHeaderView
        walletView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        
        var coloredCardViews = [ColoredCardView]()
        
        self.cards?.forEach({ (card) in
            
            let cardView = ColoredCardView.nibForClass()
            
            if let timeBase = timeBase{
                
                cardView.timeBase = TimeInterval(timeBase*60)
                cardView.titulo.text = card.Titulo
                cardView.descricao.text = card.Descricao
                cardView.subtitulo.text = card.Era
                
                
                coloredCardViews.append(cardView)
            }
        })
        
        walletView.reload(cardViews: coloredCardViews)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(JogoViewController.showPlacar(_:)), name: NSNotification.Name(rawValue: "showPlacar"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(JogoViewController.dismissPlacar(_:)), name: NSNotification.Name(rawValue: "dismissPlacar"), object: nil)

        enviarTimeDaVez()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
            
    }
    
    func showPlacar(_ notification: Notification) {

        self.walletHeaderView.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
        
            self.walletView.frame.size.height = 10
            self.viewPlacar.isHidden = true
        }, completion: nil)
    }
    
    func dismissPlacar(_ notification: Notification) {
        
        let pontua = notification.object as! Bool
        
        if pontua {
            self.pontua()
        }
        
        self.trocaTime()
        
        self.walletHeaderView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            
            self.walletView.frame.size.height = self.view.frame.height - self.viewPlacar.frame.height - 68
            self.viewPlacar.isHidden = false
        }, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
  
    //MARK: Collection Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.grupos == nil {
            return 0
        }
        return self.grupos!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PlacarCollectionViewCell
        
        let grupo = self.grupos![indexPath.item]
        
        cell.imagem.image = grupo.avatar
        cell.pontos.text = String(describing: grupo.pontos!)
        cell.nome.text = grupo.nome
        
        return cell
    }

    
    func pontua() {
        
        self.grupos![self.timeAtual].addPontos()
        self.placarCV.reloadData()
    }
    
    //MARK: - Troca Time
    
    func trocaTime() {
        
        if self.timeAtual == self.grupos?.last?.id {
            
            self.timeAtual = 0
            self.imagemTurnoAtual.image = self.grupos![self.timeAtual].avatar
        }else {
            
            self.timeAtual += 1
            self.imagemTurnoAtual.image = self.grupos![self.timeAtual].avatar
        }
        
        
        //Mandar sempre o time do turno da vez
        enviarTimeDaVez()
        
        
    }
    
    func enviarTimeDaVez(){
        session?.sendMessage(["Vez":timeAtual], replyHandler: { (response: [String : Any]) in
            if let timeDaVez = response["Vez"] as? String{
                print("Vez do time \(timeDaVez)")
            }
        }, errorHandler: { (Error) in
            print("Não consegui enviar o time")
        })
    }
    
}

extension JogoViewController: WCSessionDelegate{
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("iOS: Session Ativado.")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    func sessionDidDeactivate(_ session: WCSession) {
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        if message["comando"] as? String == "Acertou"{
            
            print("Chegou no Acerto")

            let response = ["Acerto":"Acerto computado iOS"]
            replyHandler(response)
        }
        
    }
    
}

