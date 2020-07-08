import Foundation
import UIKit
import PlaygroundSupport

public class intro: UIView {
    
    let hyderabadLabel = UILabel()
    let isInLabel = UILabel()
    let knownForLabel = UILabel()
    let madeLabel = UILabel()
    let letUsSeeLabel = UILabel()
    let nowLabel = UILabel()
    let dragLabel =  UILabel()
    
    let hyderabadLocation = UIImageView()
    let pearl = UIImageView()
    
    var countVar = 0
    
    var timer = Timer()
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: 500, height: 500))
        setupUI()
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setupUI() {
        
        let cfURL = Bundle.main.url(forResource: "DancingScript", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(cfURL! as CFURL, CTFontManagerScope.process, nil)
        
        self.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        self.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        
        hyderabadLocation.image = UIImage(named: "hyderabad_location.png")
        hyderabadLocation.frame = CGRect(x: 90, y: -600 , width: 325, height: 325)
        hyderabadLocation.contentMode = .scaleAspectFit
        self.addSubview(hyderabadLocation)
        hyderabadLocation.isHidden = true
        
        pearl.image = UIImage(named: "pearl.jpeg")
        pearl.frame = CGRect(x: 115, y: -900, width: 250, height: 250)
        pearl.contentMode = .scaleAspectFit
        self.addSubview(pearl)
        pearl.isHidden = true
        
        hyderabadLabel.text = "Hyderabad"
        hyderabadLabel.textColor = UIColor.black
        hyderabadLabel.frame = CGRect(x: 20, y: -100 , width: 200, height: 100)
        hyderabadLabel.font = UIFont(name: "DancingScript-Regular", size: 32)
        self.addSubview(hyderabadLabel)
        hyderabadLabel.isHidden = true
        
        isInLabel.text = "is in southern part of India."
        isInLabel.textColor = UIColor.black
        isInLabel.frame = CGRect(x: 154, y: -100, width: 500, height: 100)
        isInLabel.font = UIFont(name: "DancingScript-Regular", size: 32)
        self.addSubview(isInLabel)
        isInLabel.isHidden = true
        
        knownForLabel.text = "is known as 'City of Pearls'."
        knownForLabel.textColor = UIColor.black
        knownForLabel.frame = CGRect(x: 154, y: -100, width: 400, height: 100)
        knownForLabel.font = UIFont(name: "DancingScript-Regular", size: 32)
        self.addSubview(knownForLabel)
        knownForLabel.isHidden = true
        
        letUsSeeLabel.text = "Let's dive deep into how"
        letUsSeeLabel.textColor = UIColor.black
        letUsSeeLabel.frame = CGRect(x: 20, y: -100, width: 400, height: 100)
        letUsSeeLabel.font = UIFont(name: "DancingScript-Regular", size: 32)
        self.addSubview(letUsSeeLabel)
        letUsSeeLabel.isHidden = true
        
        madeLabel.text = "s are made."
        madeLabel.frame = CGRect(x: 335, y: -100, width: 200, height: 100)
        madeLabel.textColor = UIColor.black
        madeLabel.font = UIFont(name: "DancingScript-Regular", size: 32)
        self.addSubview(madeLabel)
        madeLabel.isHidden = true
        
        nowLabel.text = "Now,"
        nowLabel.frame = CGRect(x: 20, y: -100, width: 150, height: 100)
        nowLabel.textColor = UIColor.black
        nowLabel.font = UIFont(name: "DancingScript-Regular", size: 35)
        self.addSubview(nowLabel)
        nowLabel.isHidden = true
        
        dragLabel.text = "Drag the objects and find the process."
        dragLabel.frame = CGRect(x: 20, y: -500, width: 750, height: 400)
        dragLabel.numberOfLines = 2
        dragLabel.textColor = UIColor.black
        dragLabel.font = UIFont(name: "DancingScript-Regular", size: 35)
        self.addSubview(dragLabel)
        dragLabel.isHidden = true
        
        animate()
        
    }
    
    func animate() {
        
        UIView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.hyderabadLabel.isHidden = false
            self.isInLabel.isHidden = false
            self.hyderabadLocation.isHidden = false
            
            self.hyderabadLabel.center.y = 50
            self.isInLabel.center.y = 50
            self.hyderabadLocation.center.y = 260
        }), completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 4.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.knownForLabel.isHidden = false
            self.pearl.isHidden = false
            
            self.isInLabel.center.y = self.isInLabel.center.y + self.frame.maxY + 10
            self.hyderabadLocation.center.y = self.hyderabadLocation.center.y + self.frame.maxY
            
            self.knownForLabel.center.y = 50
            self.pearl.center.y = 260
        }), completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 7.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.letUsSeeLabel.isHidden = false
            self.madeLabel.isHidden = false
            
            self.hyderabadLabel.center.y = self.hyderabadLabel.center.y + self.frame.maxY + 10
            self.knownForLabel.center.y = self.knownForLabel.center.y + self.frame.maxY + 10
            
            self.letUsSeeLabel.center.y = 50
            self.madeLabel.center.y = 257
        }), completion: nil)

        UIView.animate(withDuration: 1.0, delay: 10.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.nowLabel.isHidden = false
            
            self.letUsSeeLabel.center.y = self.letUsSeeLabel.center.y + self.frame.maxY + 10
            self.madeLabel.center.y = self.madeLabel.center.y + self.frame.maxY + 10
            self.pearl.center.y = self.pearl.center.y + self.frame.maxY
            
            self.nowLabel.center.y = self.frame.midY/2 - 50
            
        }), completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 11.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.dragLabel.isHidden = false
            
            self.dragLabel.center.y = self.frame.midY/2 + 50
            
        }), completion:{ (completion) -> Void in
            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.nextScreen), userInfo: nil, repeats: false)
        })
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
               
        let briefProcessView = briefProcess(scene: self)
        PlaygroundPage.current.liveView = briefProcessView
        
    }
    
}
