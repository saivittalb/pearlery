import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class nurturing: UIView {
    
    let nurturingLabel = UILabel()
    let feedNurturingLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let nurturingImage = UIImageView()
    let nurturingFeedImage = UIImageView()
    let doneCheckMarkImage = UIImageView()
    
    let nurturingImageFrame = CGRect(x: 50, y: 140, width: 80, height: 80)
    
    let nextScreenButton = UIButton()
    
    var timer = Timer()
    
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
        
        nurturingImage.image = UIImage(named: "algae_food.jpeg")
        nurturingImage.frame = nurturingImageFrame
        nurturingImage.contentMode = .scaleAspectFit
        self.addSubview(nurturingImage)
        
        nurturingFeedImage.image = UIImage(named: "sad_oyster.png")
        nurturingFeedImage.frame = CGRect(x: 170, y: 160, width: 200, height: 200)
        nurturingFeedImage.contentMode = .scaleAspectFit
        self.addSubview(nurturingFeedImage)
        
        doneCheckMarkImage.image = UIImage(named: "done_check_mark.png")
        doneCheckMarkImage.frame = CGRect(x: 395, y: 370, width: 40, height: 40)
        doneCheckMarkImage.contentMode = .scaleAspectFit
        self.addSubview(doneCheckMarkImage)
        doneCheckMarkImage.isHidden = true
        
        nurturingLabel.text = "Nurturing"
        nurturingLabel.frame = CGRect(x: 20, y: -10, width: 400, height: 120)
        nurturingLabel.textColor = UIColor.black
        nurturingLabel.font = UIFont(name: "DancingScript-Regular", size: 32)
        self.addSubview(nurturingLabel)
        
        nextScreenButton.setTitle("Let's Go", for: .normal)
        nextScreenButton.backgroundColor = UIColor.black
        nextScreenButton.frame = CGRect(x: 370, y: 430, width: 100, height: 50)
        nextScreenButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        nextScreenButton.layer.cornerRadius = 15.0
        nextScreenButton.addTarget(self, action: #selector(self.nextScreen), for: .touchUpInside)
        self.addSubview(nextScreenButton)
        nextScreenButton.isHidden = true
        
        feedNurturingLabel.text = "Drag the algae towards the sad oyster to feed and make it happy"
        feedNurturingLabel.frame = CGRect(x: 20, y: -5, width: 500, height: 200)
        feedNurturingLabel.numberOfLines = 2
        feedNurturingLabel.textColor = UIColor.black
        feedNurturingLabel.font = UIFont(name: "DancingScript-Regular", size: 20)
        self.addSubview(feedNurturingLabel)
        
    }

    @objc func performAnimation() {
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            self.doneCheckMarkImage.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi/8)
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseInOut, animations: {
            self.doneCheckMarkImage.transform = CGAffineTransform.init(rotationAngle: -CGFloat.pi/8)
        }, completion: nil)
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if nurturingImage.frame.contains(location) {
                nurturingImage.center = location
            }
        }
        
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if nurturingImage.frame.contains(location) {
                nurturingImage.center = location
            }
        }
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if nurturingImage.frame.intersects(nurturingFeedImage.frame) {
            nurturingImage.center = nurturingFeedImage.center
            nurturingFeedImage.image = UIImage(named: "happy_oyster.jpeg")
            nurturingFeedImage.frame = CGRect(x: 150, y: 160, width: 200, height: 200)
            playSound()
            doneCheckMarkImage.isHidden = false
            timer = Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: false)
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: false)
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: false)
            timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: false)
            timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: false)
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: false)
            timer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: false)
            timer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: false)
            timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: false)
            timer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: false)
        }  else {
            timer.invalidate()
            nurturingImage.frame = nurturingImageFrame
        }
        
        nextScreenButton.isHidden = false
        
    }
    
    @objc func nextScreen() {
        
        playSound()
        
        self.removeFromSuperview()
        
        let comprehensiveProcessView = comprehensiveProcess(scene: self, stage: 2)
        PlaygroundPage.current.liveView = comprehensiveProcessView
        
    }
    
}
