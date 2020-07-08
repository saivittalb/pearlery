import Foundation
import UIKit
import PlaygroundSupport

public class transitionBriefProcess: UIView {
    
    var andSoLabel = UILabel()
    var paraLabel = UILabel()
    
    var cityBackground = UIImageView()
    var me = UIImageView()
    var speechBubble = UIImageView()
    
    var eachProcessLabel = UILabel()
    var nowLabel = UILabel()
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: 500, height: 500))
        setupUI()
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setupUI() {
        
        self.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        self.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        
        performParaAction()
    }
    
    func performParaAction() {
        
        let cfURL = Bundle.main.url(forResource: "DancingScript", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(cfURL! as CFURL, CTFontManagerScope.process, nil)
        
        andSoLabel.text = "And so, that's the process..."
        andSoLabel.textColor = UIColor.black
        andSoLabel.frame = CGRect(x: 20, y: 75, width: 350, height: 200)
        andSoLabel.font = UIFont(name: "DancingScript-Regular", size: 32)
        andSoLabel.alpha = 0
        self.addSubview(andSoLabel)
        
        paraLabel.text = "Pearl production requires a lot of planning and efforts."
        paraLabel.textColor = UIColor.black
        paraLabel.frame = CGRect(x: 20, y: 100, width: 500, height: 400)
        paraLabel.numberOfLines = 2
        paraLabel.font = UIFont(name: "DancingScript-Regular", size: 30)
        paraLabel.alpha = 0
        self.addSubview(paraLabel)
        
        animatePara()
    }
    
    func animatePara() {
        
        UIView.animate(withDuration: 2.0, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.andSoLabel.alpha = 1
            
        }), completion: nil)
        
        UIView.animate(withDuration: 3.0, delay: 1.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.paraLabel.alpha = 1
            
        }), completion: { (completion) -> Void in
            self.andSoLabel.isHidden = true
            self.paraLabel.isHidden = true
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.performCityAction), userInfo: nil, repeats: false)
        })
        
        
        
    }
    
    @objc func performCityAction() {
        
        let cfURL = Bundle.main.url(forResource: "Zeyada", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(cfURL! as CFURL, CTFontManagerScope.process, nil)
        
        cityBackground.image = UIImage(named: "city_background.jpg")
        cityBackground.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        cityBackground.contentMode = .scaleToFill
        cityBackground.alpha = 0.0
        self.addSubview(cityBackground)
        cityBackground.isHidden = true
        
        me.image = UIImage(named: "person.png")
        me.frame = CGRect(x: 30, y: 235, width: 300, height: 300)
        me.contentMode = .scaleAspectFit
        me.alpha = 0.0
        self.addSubview(me)
        me.isHidden = true
        
        speechBubble.image = UIImage(named: "speech_bubble.png")
        speechBubble.frame = CGRect(x: 145, y: 152, width: 245, height: 145)
        speechBubble.contentMode = .scaleAspectFit
        speechBubble.alpha = 0.0
        self.addSubview(speechBubble)
        speechBubble.isHidden = true
        
        eachProcessLabel.text = "Let's gaze at each process."
        eachProcessLabel.frame = CGRect(x: 202, y: 115, width: 200, height: 200)
        eachProcessLabel.textColor = UIColor.darkGray
        eachProcessLabel.font = UIFont(name: "Zeyada", size: 30)
        eachProcessLabel.numberOfLines = 2
        eachProcessLabel.alpha = 0.0
        self.addSubview(eachProcessLabel)
        eachProcessLabel.isHidden = true
        
        nowLabel.text = "Now,"
        nowLabel.textColor = UIColor.darkGray
        nowLabel.frame = CGRect(x: 245, y: 165, width: 150, height: 100)
        nowLabel.font = UIFont(name: "Zeyada", size: 32)
        nowLabel.alpha = 0.0
        self.addSubview(nowLabel)
        nowLabel.isHidden = true
        
        cityAnimation()
        
    }
    
    func cityAnimation() {
        
        cityBackground.isHidden = false
        me.isHidden = false
        speechBubble.isHidden = false
        nowLabel.isHidden = false
        
        func showCityViewAnimation() {
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveLinear, animations: {
                self.cityBackground.alpha = 0.7
                self.me.alpha = 1
                self.speechBubble.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: {
                self.nowLabel.alpha = 1
            }, completion: { (completed) in
                let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
                rotationAnimation.fromValue = 0.0
                rotationAnimation.toValue = -Double.pi * 2
                rotationAnimation.repeatCount = 1
                rotationAnimation.duration = 0.5
                self.speechBubble.layer.add(rotationAnimation, forKey: nil)
                self.nowLabel.layer.add(rotationAnimation, forKey: nil)
                
                showParaAnimation()
            })
            
        }
        
        
        func showParaAnimation() {
            
            self.eachProcessLabel.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: {
                self.nowLabel.alpha = 0
                self.eachProcessLabel.alpha =  1
            }) { (completion) in
                self.nowLabel.isHidden = true
                Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.nextScreen), userInfo: nil, repeats: false)
            }
        }
        
        showCityViewAnimation()
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let comprehensiveProcessView = comprehensiveProcess(scene: self, stage: 0)
        PlaygroundPage.current.liveView = comprehensiveProcessView
        
    }
    
}
