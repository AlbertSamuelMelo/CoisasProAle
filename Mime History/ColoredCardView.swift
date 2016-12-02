
import UIKit
import Wallet
import WatchConnectivity

class ColoredCardView: CardView {
    
    //MARK: - Session Watch
    
    var session: WCSession?{
        didSet{
            if let session = session{
                session.delegate = self
                session.activate()
            }
        }
    }
    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var acertouBt: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var bgCard: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var subtitulo: UILabel!
    @IBOutlet weak var tempo: UIImageView!
    @IBOutlet weak var descricaoView: UIView!
    @IBOutlet weak var descricao: UILabel!
    @IBOutlet weak var cowdownView: UIView!
    @IBOutlet weak var tachinha: UIButton!
    
    var pontua: Bool = false
    
    let presentedCardViewColor: UIColor = .clear
    
    lazy var depresentedCardViewColor: UIColor = {
        return UIColor(patternImage: #imageLiteral(resourceName: "cardBack"))
    }()
    
    var timeBase: TimeInterval?
    var timerCowdown = Timer()
    
    var timeBonds: CGFloat?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cowdownView.layer.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        self.cowdownView.layer.cornerRadius = 12
        self.cowdownView.frame.size.width = self.tempo.frame.size.width - 10
        self.cowdownView.center.y = self.tempo.center.y
        self.cowdownView.center.x = self.tempo.center.x - 95.0

        self.contentView.layer.masksToBounds = true
        
                self.presentedDidUpdate()
        
    }
    
    override var presented: Bool { didSet { presentedDidUpdate() } }
    
    func presentedDidUpdate() {
        
        self.tachinha.isHidden = !presented
        self.cowdownView.isHidden = !presented
        self.descricaoView.isHidden = !presented
        self.acertouBt.isHidden = !presented
        self.image.isHidden = !presented
        self.bgCard.isHidden = !presented
        self.titulo.isHidden = !presented
        self.subtitulo.isHidden = !presented
        self.tempo.isHidden = !presented
        self.contentView.backgroundColor = presented ? presentedCardViewColor : depresentedCardViewColor
        
        if presented {

            self.showPlacar()
        }else {
            
            self.dismissPlacar()
        }
        
        contentView.addTransitionFade()
        
        //Testes Watch
        estaGanhado()
        
    }
    
    @IBAction func acertou() {
        
        self.qAcerta()
    }
    
    func qAcerta() {
        
        // aqui essa linda funcao, pra nao falar outra coisa
        timerCowdown.invalidate()
        self.pontua = true
        self.dismiss()
    }
    
    @IBAction func tachinha(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.75, animations: {
        
            sender.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.descricaoView.transform = CGAffineTransform(translationX: 0, y: (self.walletView?.frame.height)!)
        }) { (finished) in
            
            sender.isHidden = true
        }
        timeBonds = cowdownView.bounds.width/CGFloat(timeBase!)
        playRegress()
        //verificando se e suportado
        if WCSession.isSupported(){
            session = WCSession.default()
        }
    }
    
    
    func dismiss() {
        
        walletView?.remove(cardView: self, animated: true)
    }
    
    func showPlacar() {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showPlacar"), object: nil)
    }
    
    func dismissPlacar() {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dismissPlacar"), object: self.pontua)
    }
    
    func playRegress(){
        timerCowdown = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.RegressiveCrono), userInfo: nil, repeats: true)
    }
    func RegressiveCrono() {
        
        timeBase = timeBase! - 1.0
        cowdownView.bounds.size.width = cowdownView.bounds.size.width - timeBonds!
        
        if timeBase == 0 {
            //Finish Cronometro regressivo
            timerCowdown.invalidate()
            self.pontua = false
            estaGanhado()
            self.dismiss()
        }
    }
    
    //MARK: - Watch Methods
    
    
    
    var quantidadeDe = Int(InfosViewController().sliderEquipes.currentValue!)
    
    var grupos: [Grupo]? = []
    
    func estaGanhado() {
        
        self.grupos = GrupoStore.singleton.pegarGrupo(self.quantidadeDe)
        var pontuacaoDoTime: [(Int, String)] = []
        
        grupos?.forEach({ (grupo) in
            let element1:(Int, String) = (grupo.pontos!, grupo.nome!)
            pontuacaoDoTime.append(element1)
        })
        
        //Time com maior pontuaçao
        pontuacaoDoTime.sort(by: >)
        
        let send = pontuacaoDoTime[0].1
        
        session?.sendMessage(["comando":send], replyHandler: { (response: [String : Any]) in
            if let response = response["Time"] as? String{
                print("Time enviado watchOS")
                print("Time ganhando \(response)")
            }
        }, errorHandler: { (Error) in
            print("Não eviou o time vencedor")
        })
        
        
    }
    
    
}


extension ColoredCardView: WCSessionDelegate{
    
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
            
            self.qAcerta()
            
            let response = ["Acerto":"Acerto computado iOS"]
            replyHandler(response)
        }
        
    }
    
}
