import Foundation
import UIKit
import PlaygroundSupport

public class thankYou: UIView {
    
    let processLabel = UILabel()
    let thanksLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let cityBackground = UIImageView()
    let me = UIImageView()
    let speechBubble =  UIImageView()
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: 500, height: 500))
        setupUI()
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setupUI() {
        
        let cfURL = Bundle.main.url(forResource: "Zeyada", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(cfURL! as CFURL, CTFontManagerScope.process, nil)
        
        self.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        self.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        
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
        
        processLabel.text = "So, this is the process."
        processLabel.textColor = UIColor.black
        processLabel.frame = CGRect(x: 215, y: 115, width: 200, height: 200)
        processLabel.font = UIFont(name: "Zeyada", size: 30)
        processLabel.numberOfLines = 2
        processLabel.alpha = 0.0
        self.addSubview(processLabel)
        processLabel.isHidden = true
        
        thanksLabel.text = "Thanks for watching!"
        thanksLabel.frame = CGRect(x: 210, y: 110, width: 150, height: 200)
        thanksLabel.textColor = UIColor.black
        thanksLabel.font = UIFont(name: "Zeyada", size: 28)
        thanksLabel.numberOfLines = 2
        thanksLabel.alpha = 0.0
        self.addSubview(thanksLabel)
        thanksLabel.isHidden = true
        
        performAnimation()
        
    }
    
    func performAnimation() {
        me.isHidden = false
        cityBackground.isHidden = false
        speechBubble.isHidden = false
        processLabel.isHidden = false
        
        func showCityAnimation() {
            UIView.animate(withDuration: 0.5) {
                self.me.alpha = 1
                self.cityBackground.alpha = 0.7
                self.speechBubble.alpha = 1
            }
            
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: {
                self.processLabel.alpha = 1
            }) { (completed) in
                sayThanksAnimation()
            }
        }
        
        func sayThanksAnimation() {
            self.thanksLabel.isHidden = false
            
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: {
                self.processLabel.alpha = 0
                self.thanksLabel.alpha = 1
            }) { (complete) in
                self.processLabel.isHidden = true
                self.processLabel.text = "Hope you enjoyed 'Pearlery'!"
                self.processLabel.frame = CGRect(x: 200, y: 115, width: 200, height: 200)
                self.processLabel.font = UIFont(name: "Zeyada", size: 25)
                self.processLabel.numberOfLines = 2
                sayThanksAnimationAgain()
            }
        }
        
        func sayThanksAnimationAgain() {
            self.processLabel.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: {
                self.processLabel.alpha = 1
                self.thanksLabel.alpha = 0
            }) { (complete) in
                self.thanksLabel.isHidden = true
                self.thanksLabel.text = "Goodbye and take care!"
                self.thanksLabel.frame = CGRect(x: 205, y: 115, width: 200, height: 200)
                self.thanksLabel.font = UIFont(name: "Zeyada", size: 28)
                sayByeAnimation()
            }
        }
        
        func sayByeAnimation() {
            self.thanksLabel.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: {
                self.processLabel.alpha = 0
                self.thanksLabel.alpha = 1
            }) { (complete) in
                self.processLabel.isHidden = true
            }
        }
        
        showCityAnimation()
        
    }
    
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            print(touch.location(in: self))
        }
        
    }
    
}
