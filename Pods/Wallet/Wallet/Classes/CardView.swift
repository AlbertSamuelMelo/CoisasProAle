
/**  The CardView class defines the attributes and behavior of the cards that appear in WalletView objects. */
open class CardView: UIView {
    
    // MARK: Public methods
    
    /**
     Initializes and returns a newly allocated card view object with the specified frame rectangle.
     
     - parameter aRect: The frame rectangle for the card view, measured in points.
     - returns: An initialized card view.
     */
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupGestures()
    }
    
    /**
     Returns a card view object initialized from data in a given unarchiver.
     
     - parameter aDecoder: An unarchiver object.
     - returns: A card view, initialized using the data in decoder.
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGestures()
    }
    
    /**  A Boolean value that determines whether the view is presented. */
    open var presented: Bool = false
    
    
    /**  A parent wallet view object, or nil if the card view is not visible. */
    public var walletView: WalletView? {
        return container()
    }
    
    /** This method is called when the card view is tapped. */
    @objc open func tapped() {
        if let _ = walletView?.presentedCardView {
            return
        } else {
            walletView?.present(cardView: self, animated: true)
        }
    }
    
    // MARK: Private methods
    
    let tapGestureRecognizer    = UITapGestureRecognizer()
    
    func setupGestures() {
        
        tapGestureRecognizer.addTarget(self, action: #selector(CardView.tapped))
        tapGestureRecognizer.delegate = self
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    func updateGrabbedCardViewOffset(gestureRecognizer: UIPanGestureRecognizer) {
        let offset = gestureRecognizer.translation(in: walletView).y
        if presented && offset > 0 {
            walletView?.updateGrabbedCardView(offset: offset)
        } else if !presented {
            walletView?.updateGrabbedCardView(offset: offset)
        }
    }
    
}

extension CardView: UIGestureRecognizerDelegate {
    
    /**
     Asks the delegate if two gesture recognizers should be allowed to recognize gestures simultaneously.
     
     - parameter gestureRecognizer: An instance of a subclass of the abstract base class UIGestureRecognizer. This gesture-recognizer object is about to begin processing touches to determine if its gesture is occurring.
     - parameter otherGestureRecognizer: An instance of a subclass of the abstract base class UIGestureRecognizer.
     
     */
    open func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return gestureRecognizer != tapGestureRecognizer && otherGestureRecognizer != tapGestureRecognizer
    }
    
    
}

internal extension UIView {
    
    func container<T: UIView>() -> T? {
        
        var view = superview
        
        while view != nil {
            if let view = view as? T {
                return view
            }
            view = view?.superview
        }
        
        return nil
    }
    
}
