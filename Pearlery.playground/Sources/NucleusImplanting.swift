import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class nucleusImplanting: UIView {
    
    let nucleusLabel = UILabel()
    let feedNucleusLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let nucleusImage = UIImageView()
    let nucleusFeedImage = UIImageView()
    let doneCheckMarkImage = UIImageView()
    
    let nextScreenButton = UIButton()
    
    let nucleusImageFrame = CGRect(x: 50, y: 140, width: 40, height: 30)
    
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
        
        let cfURL = Bundle.main.url(forResource: "DancingScript", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(cfURL! as CFURL, CTFontManagerScope.process, nil)
        
        self.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        self.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        
        backgroundImage.image = UIImage(named: "winter_background.png")
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.alpha = 0.05
        self.addSubview(backgroundImage)
        
        nucleusImage.image = UIImage(named: "nucleus.jpeg")
        nucleusImage.frame = nucleusImageFrame
        nucleusImage.contentMode = .scaleAspectFit
        self.addSubview(nucleusImage)
        
        nucleusFeedImage.image = UIImage(named: "oyster_feed.png")
        nucleusFeedImage.frame = CGRect(x: 125, y: 125, width: 250, height: 250)
        nucleusFeedImage.contentMode = .scaleAspectFit
        self.addSubview(nucleusFeedImage)

        doneCheckMarkImage.image = UIImage(named: "done_check_mark.png")
        doneCheckMarkImage.frame = CGRect(x: 395, y: 370, width: 40, height: 40)
        doneCheckMarkImage.contentMode = .scaleAspectFit
        self.addSubview(doneCheckMarkImage)
        doneCheckMarkImage.isHidden = true
        
        nucleusLabel.text = "Nucleus implanting"
        nucleusLabel.frame = CGRect(x: 20, y: -10, width: 400, height: 120)
        nucleusLabel.textColor = UIColor.black
        nucleusLabel.font = UIFont(name: "DancingScript-Regular", size: 32)
        self.addSubview(nucleusLabel)
        
        nextScreenButton.setTitle("Let's Go", for: .normal)
        nextScreenButton.backgroundColor = UIColor.black
        nextScreenButton.frame = CGRect(x: 370, y: 430, width: 100, height: 50)
        nextScreenButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        nextScreenButton.layer.cornerRadius = 15.0
        nextScreenButton.addTarget(self, action: #selector(self.nextScreen), for: .touchUpInside)
        self.addSubview(nextScreenButton)
        nextScreenButton.isHidden = true
        
        feedNucleusLabel.text = "Drag the nucleus and graft received from donor oyster to the feeder"
        feedNucleusLabel.frame = CGRect(x: 20, y: -5, width: 500, height: 200)
        feedNucleusLabel.numberOfLines = 2
        feedNucleusLabel.textColor = UIColor.black
        feedNucleusLabel.font = UIFont(name: "DancingScript-Regular", size: 19)
        self.addSubview(feedNucleusLabel)

    }
    
    func startAnimation() {
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi * 2
        rotationAnimation.repeatCount = 3
        doneCheckMarkImage.layer.add(rotationAnimation, forKey: nil)
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if nucleusImage.frame.contains(location) {
                nucleusImage.center = location
            }
        }
        
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if nucleusImage.frame.contains(location) {
                nucleusImage.center = location
            }
        }
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if nucleusImage.frame.intersects(nucleusFeedImage.frame) {
            nucleusImage.center = nucleusFeedImage.center
            playSound()
            doneCheckMarkImage.isHidden = false
            startAnimation()
        }  else {
            nucleusImage.frame = nucleusImageFrame
            doneCheckMarkImage.layer.removeAllAnimations()
        }
        
        nextScreenButton.isHidden = false
        
    }
    
    @objc func nextScreen() {
        
        playSound()
        
        self.removeFromSuperview()
        
        let comprehensiveProcessView = comprehensiveProcess(scene: self, stage: 1)
        PlaygroundPage.current.liveView = comprehensiveProcessView
        
    }
    
}
