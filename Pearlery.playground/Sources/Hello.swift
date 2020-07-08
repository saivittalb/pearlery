import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class hello: UIView {
    
    let welcomeLabel = UILabel()
    let heyLabel = UILabel()
    let introductionLabel = UILabel()
    
    let goButton = UIButton()
    
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
    
    fileprivate var audioURL: AVAudioPlayer? {
        didSet {
            
        }
    }
     
    fileprivate func playSound() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            fatalError("Audio setup failed")
        }
        guard
            let audioURL = Bundle.main.url(forResource: "button_click", withExtension: "mp3"),
            let player = try? AVAudioPlayer(contentsOf: audioURL)
            else {
                fatalError("Player creation failed")
        }
        self.audioURL = player
        player.play()
    }
    
    func setupUI() {
        
        let cfURL = Bundle.main.url(forResource: "Zeyada", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(cfURL! as CFURL, CTFontManagerScope.process, nil)
        
        self.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        self.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        
        backgroundImage.image = UIImage(named: "winter_background.png")
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.alpha = 0.2
        self.addSubview(backgroundImage)
        
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
        
        heyLabel.text = "Heyo!"
        heyLabel.textColor = UIColor.black
        heyLabel.frame = CGRect(x: 235, y: 165, width: 150, height: 100)
        heyLabel.font = UIFont(name: "Zeyada", size: 40)
        heyLabel.alpha = 0.0
        self.addSubview(heyLabel)
        heyLabel.isHidden = true
        
        introductionLabel.text = "I am Vittal."
        introductionLabel.frame = CGRect(x: 200, y: 165, width: 150, height: 100)
        introductionLabel.textColor = UIColor.black
        introductionLabel.font = UIFont(name: "Zeyada", size: 35)
        introductionLabel.numberOfLines = 2
        introductionLabel.alpha = 0.0
        self.addSubview(introductionLabel)
        introductionLabel.isHidden = true
        
        letsGo()
        
    }
    
    func letsGo() {
        
        let cfURL = Bundle.main.url(forResource: "DancingScript", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(cfURL! as CFURL, CTFontManagerScope.process, nil)
        
        welcomeLabel.text = "Welcome to Pearlery!"
        welcomeLabel.textColor = UIColor.black
        welcomeLabel.frame = CGRect(x: 42, y: 90, width: 500, height: 300)
        welcomeLabel.font = UIFont(name: "DancingScript-Regular", size: 55)
        self.addSubview(welcomeLabel)
        
        goButton.setTitle("Let's Go", for: .normal)
        goButton.backgroundColor = UIColor.black
        goButton.frame = CGRect(x: 355, y: 400, width: 100, height: 50)
        goButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        goButton.layer.cornerRadius = 15.0
        goButton.addTarget(self, action: #selector(goButtonPressed), for: .touchUpInside)
        self.addSubview(goButton)
        
    }
    
    @objc func goButtonPressed(sender: UIButton) {
        
        welcomeLabel.isHidden = true
        goButton.isHidden = true
        backgroundImage.isHidden = true
        playSound()
        performAnimation()
        
    }
    
    func performAnimation() {
        
        func showMeAnimation() {
            
            cityBackground.isHidden = false
            speechBubble.isHidden = false
            me.isHidden = false
            introductionLabel.isHidden = false
            heyLabel.isHidden = false
            
            UIView.animate(withDuration: 1) {
                self.cityBackground.alpha = 0.7
            }
            
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: {
                self.me.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseOut, animations: {
                self.speechBubble.alpha = 1
                self.heyLabel.alpha = 1
            }, completion: { (completed) in
                let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
                rotationAnimation.fromValue = 0.0
                rotationAnimation.toValue = Double.pi * 2
                rotationAnimation.repeatCount = 1
                rotationAnimation.duration = 0.5
                self.speechBubble.layer.add(rotationAnimation, forKey: nil)
                self.heyLabel.layer.add(rotationAnimation, forKey: nil)
                
                introduceMeAnimation()
            })
            
        }
        
        func introduceMeAnimation() {
            
            UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseOut, animations: {
                self.introductionLabel.alpha = 1.0
                self.heyLabel.alpha = 0.0
            }) { (completion) in
                self.heyLabel.isHidden = true
                introducePlaceAnimation()
            }
            
        }
        
        func introducePlaceAnimation() {
            
            let cfURL = Bundle.main.url(forResource: "Zeyada", withExtension: "ttf")
            CTFontManagerRegisterFontsForURL(cfURL! as CFURL, CTFontManagerScope.process, nil)
            
            self.heyLabel.frame = CGRect(x: 200, y: 110, width: 200, height: 200)
            self.heyLabel.font = UIFont(name: "Zeyada", size: 25)
            self.heyLabel.text = "This is my home city, Hyderabad."
            self.heyLabel.numberOfLines = 3
            self.heyLabel.isHidden = false
            
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: {
                self.introductionLabel.alpha = 0.0
                self.heyLabel.alpha = 1.0
            }) { (completion) in
                self.introductionLabel.isHidden = true
                self.introductionLabel.frame = CGRect(x: 200, y: 110, width: 200, height: 200)
                self.introductionLabel.font = UIFont(name: "Zeyada", size: 24)
                self.introductionLabel.text = "Come, I will take you around."
                self.introductionLabel.numberOfLines = 3
                showHyderabadAnimation()
            }
        }
        
        func showHyderabadAnimation() {
            
            self.introductionLabel.isHidden = false
            self.backgroundImage.isHidden = false
            self.backgroundImage.alpha = 0.0
            
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                self.introductionLabel.alpha = 1.0
                self.heyLabel.alpha = 0.0
            }) { (completion) in
                self.heyLabel.isHidden = true
                showComputerAnimation()
            }
            
        }
        
        func showComputerAnimation() {
            
            UIView.animate(withDuration: 0.0, delay: 2, options: .curveEaseOut, animations: {
                self.me.alpha = 0
                self.speechBubble.alpha = 0
                self.introductionLabel.alpha = 0
                self.cityBackground.alpha = 0
            }) { (completion) in
                Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false, block: { (time) in
                    self.nextScreen()
                })
            }
            
        }
        
        showMeAnimation()
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            print(touch.location(in: self))
        }
    }
    
    func nextScreen() {
        
        self.removeFromSuperview()
        
        let introView = intro(scene: self)
        PlaygroundPage.current.liveView = introView
        
    }
    
}
