import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class harvesting: UIView {
    
    let harvestingLabel = UILabel()
    let feedHarvestingLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let pearlImage = UIImageView()
    let pearlFeedImage = UIImageView()
    let pearlOysterImage = UIImageView()
    let emptyOysterImage = UIImageView()
    let doneCheckMarkImage = UIImageView()
    
    let nextScreenButton = UIButton()
    
    var timer = Timer()
    
    let pearlImageFrame = CGRect(x: 345, y: 245, width: 40, height: 40)
    
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
        
        pearlFeedImage.image = UIImage(named: "bucket.png")
        pearlFeedImage.frame = CGRect(x: 70, y: 200, width: 100, height: 100)
        pearlFeedImage.contentMode = .scaleAspectFit
        self.addSubview(pearlFeedImage)
        
        pearlOysterImage.image = UIImage(named: "pearl_oyster.png")
        pearlOysterImage.frame = CGRect(x: 270, y: 160, width: 200, height: 200)
        pearlOysterImage.contentMode = .scaleAspectFit
        self.addSubview(pearlOysterImage)
        
        pearlImage.image = UIImage(named: "pearl_from_oyster.png")
        pearlImage.frame = pearlImageFrame
        pearlImage.contentMode = .scaleAspectFit
        self.addSubview(pearlImage)
        
        emptyOysterImage.image = UIImage(named: "empty_oyster.png")
        emptyOysterImage.frame = CGRect(x: 270, y: 160, width: 200, height: 200)
        emptyOysterImage.contentMode = .scaleAspectFit
        self.addSubview(emptyOysterImage)
        emptyOysterImage.isHidden = true
        
        doneCheckMarkImage.image = UIImage(named: "done_check_mark.png")
        doneCheckMarkImage.frame = CGRect(x: 395, y: 370, width: 40, height: 40)
        doneCheckMarkImage.contentMode = .scaleAspectFit
        self.addSubview(doneCheckMarkImage)
        doneCheckMarkImage.isHidden = true
        
        harvestingLabel.text = "Harvesting"
        harvestingLabel.frame = CGRect(x: 20, y: -10, width: 400, height: 120)
        harvestingLabel.textColor = UIColor.black
        harvestingLabel.font = UIFont(name: "DancingScript-Regular", size: 32)
        self.addSubview(harvestingLabel)
        
        nextScreenButton.setTitle("Let's Go", for: .normal)
        nextScreenButton.backgroundColor = UIColor.black
        nextScreenButton.frame = CGRect(x: 370, y: 430, width: 100, height: 50)
        nextScreenButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        nextScreenButton.layer.cornerRadius = 15.0
        nextScreenButton.addTarget(self, action: #selector(self.nextScreen), for: .touchUpInside)
        self.addSubview(nextScreenButton)
        nextScreenButton.isHidden = true
        
        feedHarvestingLabel.text = "Drag the pearl from the oyster to the bucket"
        feedHarvestingLabel.frame = CGRect(x: 20, y: -5, width: 500, height: 200)
        feedHarvestingLabel.numberOfLines = 2
        feedHarvestingLabel.textColor = UIColor.black
        feedHarvestingLabel.font = UIFont(name: "DancingScript-Regular", size: 20)
        self.addSubview(feedHarvestingLabel)
        
    }
    
    @objc func performAnimation() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            self.doneCheckMarkImage.center.x = 380
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 1, options: .curveLinear, animations: {
            self.doneCheckMarkImage.center.x = 415
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 2, options: .curveLinear, animations: {
            self.doneCheckMarkImage.center.y = 300
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 2, options: .curveEaseOut, animations: {
            self.doneCheckMarkImage.center.y = 390
        }, completion: nil)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if pearlImage.frame.contains(location) {
                pearlImage.center = location
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if pearlImage.frame.contains(location) {
                pearlImage.center = location
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if pearlImage.frame.intersects(pearlFeedImage.frame) {
            pearlImage.center = pearlFeedImage.center
            pearlImage.isHidden = true
            pearlOysterImage.isHidden = true
            emptyOysterImage.isHidden = false
            playSound()
            doneCheckMarkImage.isHidden = false
            timer = Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(self.performAnimation), userInfo: nil, repeats: false)
        }  else {
            timer.invalidate()
            pearlImage.frame = pearlImageFrame
        }
        
        nextScreenButton.isHidden = false
        
    }
    
    @objc func nextScreen() {
        
        playSound()
        
        self.removeFromSuperview()
                
        let comprehensiveProcessView = comprehensiveProcess(scene: self, stage: 3)
        PlaygroundPage.current.liveView = comprehensiveProcessView
        
    }
    
}
