import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class colouring: UIView {
    
    let colouringLabel = UILabel()
    let feedColouringLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let pearlImage = UIImageView()
    let doneCheckMarkImage = UIImageView()
    
    let lavenderButton = UIButton()
    let whiteButton = UIButton()
    let peachButton = UIButton()
    let blackButton = UIButton()
    
    let nextScreenButton = UIButton()
    
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
        
        lavenderButton.setTitle("Lavender", for: .normal)
        lavenderButton.backgroundColor = UIColor.magenta
        lavenderButton.frame = CGRect(x: 60, y: 130, width: 80, height: 50)
        lavenderButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        lavenderButton.layer.cornerRadius = 15.0
        lavenderButton.addTarget(self, action: #selector(self.lavenderButtonPressed(sender:)), for: .touchUpInside)
        self.addSubview(lavenderButton)
        
        whiteButton.setTitle("White", for: .normal)
        whiteButton.backgroundColor = UIColor.cyan
        whiteButton.setTitleColor(UIColor.black, for: .normal)
        whiteButton.frame = CGRect(x: 160, y: 130, width: 80, height: 50)
        whiteButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        whiteButton.layer.cornerRadius = 15.0
        whiteButton.addTarget(self, action: #selector(self.whiteButtonPressed(sender:)), for: .touchUpInside)
        self.addSubview(whiteButton)
        
        peachButton.setTitle("Peach", for: .normal)
        peachButton.backgroundColor = UIColor.orange
        peachButton.setTitleColor(UIColor.black, for: .normal)
        peachButton.frame = CGRect(x: 260, y: 130, width: 80, height: 50)
        peachButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        peachButton.layer.cornerRadius = 15.0
        peachButton.addTarget(self, action: #selector(self.peachButtonPressed(sender:)), for: .touchUpInside)
        self.addSubview(peachButton)
        
        blackButton.setTitle("Black", for: .normal)
        blackButton.backgroundColor = UIColor.black
        blackButton.frame = CGRect(x: 360, y: 130, width: 80, height: 50)
        blackButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        blackButton.layer.cornerRadius = 15.0
        blackButton.addTarget(self, action: #selector(self.blackButtonPressed(sender:)), for: .touchUpInside)
        self.addSubview(blackButton)
        
        pearlImage.image = UIImage(named: "even_white_pearl.png")
        pearlImage.frame = CGRect(x: 190, y: 235, width: 100, height: 100)
        pearlImage.contentMode = .scaleAspectFit
        self.addSubview(pearlImage)
        
        doneCheckMarkImage.image = UIImage(named: "done_check_mark.png")
        doneCheckMarkImage.frame = CGRect(x: 395, y: 370, width: 40, height: 40)
        doneCheckMarkImage.contentMode = .scaleAspectFit
        self.addSubview(doneCheckMarkImage)
        doneCheckMarkImage.isHidden = true
        
        colouringLabel.text = "Colouring"
        colouringLabel.frame = CGRect(x: 20, y: -10, width: 400, height: 120)
        colouringLabel.textColor = UIColor.black
        colouringLabel.font = UIFont(name: "DancingScript-Regular", size: 32)
        self.addSubview(colouringLabel)
        
        nextScreenButton.setTitle("Let's Go", for: .normal)
        nextScreenButton.backgroundColor = UIColor.black
        nextScreenButton.frame = CGRect(x: 370, y: 430, width: 100, height: 50)
        nextScreenButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        nextScreenButton.layer.cornerRadius = 15.0
        nextScreenButton.addTarget(self, action: #selector(self.nextScreen), for: .touchUpInside)
        self.addSubview(nextScreenButton)
        nextScreenButton.isHidden = true
        
        feedColouringLabel.text = "Choose pearl color"
        feedColouringLabel.frame = CGRect(x: 20, y: -5, width: 500, height: 200)
        feedColouringLabel.numberOfLines = 2
        feedColouringLabel.textColor = UIColor.black
        feedColouringLabel.font = UIFont(name: "DancingScript-Regular", size: 20)
        self.addSubview(feedColouringLabel)
    
    }
    
    func startAnimation() {
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = -Double.pi * 2
        rotationAnimation.repeatCount = 3
        doneCheckMarkImage.layer.add(rotationAnimation, forKey: nil)
        
    }
    
    @objc func lavenderButtonPressed(sender: UIButton) {
        playSound()
        pearlImage.image = UIImage(named: "lavender_pearl.png")
        pearlImage.frame = CGRect(x: 190, y: 235, width: 100, height: 100)
        doneCheckMarkImage.isHidden = false
        startAnimation()
        nextScreenButton.isHidden = false
    }
    
    @objc func whiteButtonPressed(sender: UIButton) {
        playSound()
        pearlImage.image = UIImage(named: "even_white_pearl.png")
        pearlImage.frame = CGRect(x: 190, y: 235, width: 100, height: 100)
        doneCheckMarkImage.isHidden = false
        startAnimation()
        nextScreenButton.isHidden = false
    }
    
    @objc func peachButtonPressed(sender: UIButton) {
        playSound()
        pearlImage.image = UIImage(named: "peach_pearl.png")
        pearlImage.frame = CGRect(x: 190, y: 235, width: 100, height: 100)
        doneCheckMarkImage.isHidden = false
        startAnimation()
        nextScreenButton.isHidden = false
    }
    
    @objc func blackButtonPressed(sender: UIButton) {
        playSound()
        pearlImage.image = UIImage(named: "black_pearl.png")
        pearlImage.frame = CGRect(x: 180, y: 224, width: 122, height: 122)
        doneCheckMarkImage.isHidden = false
        startAnimation()
        nextScreenButton.isHidden = false
    }
    
    @objc func nextScreen() {
        
        playSound()
        
        self.removeFromSuperview()
        
        let thankYouView = thankYou(scene: self)
        PlaygroundPage.current.liveView = thankYouView
        
    }
    
}
