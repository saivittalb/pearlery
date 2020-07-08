import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class briefProcess: UIView {

    var dragAndDropLabel = UILabel()
    
    var flowBlankImage = UIImageView()
    var nucleusImage = UIImageView()
    var nurtureImage = UIImageView()
    var harvestImage = UIImageView()
    var degreaseImage = UIImageView()
    var bleachImage = UIImageView()
    var colourImage = UIImageView()
    
    var emptyNucleusImage = UIImageView()
    var emptyNurtureImage = UIImageView()
    var emptyHarvestImage = UIImageView()
    var emptyDegreaseImage = UIImageView()
    var emptyBleachImage = UIImageView()
    var emptyColourImage = UIImageView()
    
    let nucleusImageFrame = CGRect(x: 15, y: 80, width: 70, height: 50)
    let nurtureImageFrame = CGRect(x: 95, y: 80, width: 70, height: 50)
    let harvestImageFrame = CGRect(x: 175, y: 80, width: 70, height: 50)
    let degreaseImageFrame = CGRect(x: 255, y: 80, width: 70, height: 50)
    let bleachImageFrame = CGRect(x: 335, y: 80, width: 70, height: 50)
    let colourImageFrame = CGRect(x: 415, y: 80, width: 70, height: 50)
    
    let emptyNucleusImageFrame = CGRect(x: 140, y: 290, width: 88, height: 68)
    let emptyNurtureImageFrame = CGRect(x: 35, y: 361, width: 88, height: 68)
    let emptyHarvestImageFrame = CGRect(x: 140, y: 361, width: 88, height: 68)
    let emptyDegreaseImageFrame = CGRect(x: 375, y: 290, width: 88, height: 68)
    let emptyBleachImageFrame = CGRect(x: 270, y: 359, width: 88, height: 68)
    let emptyColourImageFrame = CGRect(x: 375, y: 360, width: 88, height: 68)
    
    var continueButton = UIButton()
    
    var isDraggingBlock = 0
    
    var puzzleVar = [0, 0, 0, 0, 0, 0]
    
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
        
        dragAndDropLabel.text =  "Drag and drop to know the brief process"
        dragAndDropLabel.textColor = UIColor.black
        dragAndDropLabel.frame = CGRect(x: 20, y: -10, width: 800, height: 100)
        dragAndDropLabel.font = UIFont(name: "DancingScript-Regular", size: 30)
        self.addSubview(dragAndDropLabel)
        
        flowBlankImage.image = UIImage(named: "pearl_prod_flow_blank.jpeg")
        flowBlankImage.frame = CGRect(x: 20, y: 140, width: self.frame.width/2 + 210, height: self.frame.height/2 + 50)
        flowBlankImage.contentMode = .scaleAspectFit
        self.addSubview(flowBlankImage)
        
        nucleusImage.image = UIImage(named: "nucleus_implanting.jpg")
        nucleusImage.frame = nucleusImageFrame
        nucleusImage.contentMode = .scaleAspectFit
        nucleusImage.isUserInteractionEnabled = true
        self.addSubview(nucleusImage)
        
        nurtureImage.image = UIImage(named: "nurturing.jpg")
        nurtureImage.frame = nurtureImageFrame
        nurtureImage.contentMode = .scaleAspectFit
        self.addSubview(nurtureImage)

        harvestImage.image = UIImage(named: "harvesting.jpg")
        harvestImage.frame = harvestImageFrame
        harvestImage.contentMode = .scaleAspectFit
        self.addSubview(harvestImage)

        degreaseImage.image = UIImage(named: "degreasing.jpg")
        degreaseImage.frame = degreaseImageFrame
        degreaseImage.contentMode = .scaleAspectFit
        self.addSubview(degreaseImage)

        bleachImage.image = UIImage(named: "bleaching.jpg")
        bleachImage.frame = bleachImageFrame
        bleachImage.contentMode = .scaleAspectFit
        self.addSubview(bleachImage)

        colourImage.image = UIImage(named: "colouring.jpg")
        colourImage.frame = colourImageFrame
        colourImage.contentMode = .scaleAspectFit
        self.addSubview(colourImage)
        
        emptyNucleusImage.image = nil
        emptyNucleusImage.frame = emptyNucleusImageFrame
        self.addSubview(emptyNucleusImage)
        
        emptyNurtureImage.image = nil
        emptyNurtureImage.frame = emptyNurtureImageFrame
        self.addSubview(emptyNurtureImage)
        
        emptyHarvestImage.image = nil
        emptyHarvestImage.frame = emptyHarvestImageFrame
        self.addSubview(emptyHarvestImage)
        
        emptyDegreaseImage.image = nil
        emptyDegreaseImage.frame = emptyDegreaseImageFrame
        self.addSubview(emptyDegreaseImage)
        
        emptyBleachImage.image = nil
        emptyBleachImage.frame = emptyBleachImageFrame
        self.addSubview(emptyBleachImage)
        
        emptyColourImage.image = nil
        emptyColourImage.frame = emptyColourImageFrame
        self.addSubview(emptyColourImage)
        
        continueButton.setTitle("Let's Go", for: .normal)
        continueButton.backgroundColor = UIColor.black
        continueButton.frame = CGRect(x: 370, y: 443.5, width: 100, height: 50)
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        continueButton.layer.cornerRadius = 15.0
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        
    }
    
    @objc func checkingForMatch() {
        
        if nucleusImage.frame.intersects(emptyNucleusImage.frame) {
            nucleusImage.frame = emptyNucleusImage.frame
            nucleusImage.isUserInteractionEnabled = false
            self.puzzleVar[0] = 1
            addContinueButton()
        } else {
            nucleusImage.frame = nucleusImageFrame
            self.puzzleVar[0] = 0
        }
        
        if nurtureImage.frame.intersects(emptyNurtureImage.frame) {
            nurtureImage.frame = emptyNurtureImage.frame
            nurtureImage.isUserInteractionEnabled = false
            self.puzzleVar[1] = 1
            addContinueButton()
        } else {
            nurtureImage.frame = nurtureImageFrame
            self.puzzleVar[1] = 0
        }
        
        if harvestImage.frame.intersects(emptyHarvestImage.frame) {
            harvestImage.frame = emptyHarvestImage.frame
            harvestImage.isUserInteractionEnabled = false
            self.puzzleVar[2] = 1
            addContinueButton()
        } else {
            harvestImage.frame = harvestImageFrame
            self.puzzleVar[2] = 0
        }
        
        if degreaseImage.frame.intersects(emptyDegreaseImage.frame) {
            degreaseImage.frame = emptyDegreaseImage.frame
            degreaseImage.isUserInteractionEnabled = false
            self.puzzleVar[3] = 1
            addContinueButton()
        } else {
            degreaseImage.frame = degreaseImageFrame
            self.puzzleVar[3] = 0
        }
        
        if bleachImage.frame.intersects(emptyBleachImage.frame) {
            bleachImage.frame = emptyBleachImage.frame
            bleachImage.isUserInteractionEnabled = false
            self.puzzleVar[4] = 1
            addContinueButton()
        } else {
            bleachImage.frame = bleachImageFrame
            self.puzzleVar[4] = 0
        }
        
        if colourImage.frame.intersects(emptyColourImage.frame) {
            colourImage.frame = emptyColourImage.frame
            colourImage.isUserInteractionEnabled = false
            self.puzzleVar[5] = 1
            addContinueButton()
        } else {
            colourImage.frame = colourImageFrame
            self.puzzleVar[5] = 0
        }
    }
    
    func addContinueButton() {
        
        if !self.continueButton.isDescendant(of: self) {
            self.addSubview(continueButton)
        }
        
    }
    
    func animateAnswer() {
        
        nucleusImage.isUserInteractionEnabled = false
        nurtureImage.isUserInteractionEnabled = false
        harvestImage.isUserInteractionEnabled = false
        degreaseImage.isUserInteractionEnabled = false
        bleachImage.isUserInteractionEnabled = false
        colourImage.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            
            self.nucleusImage.center = CGPoint(x: self.emptyNucleusImageFrame.midX, y: self.emptyNucleusImageFrame.midY)
            self.nurtureImage.center = CGPoint(x: self.emptyNurtureImageFrame.midX, y: self.emptyNurtureImageFrame.midY)
            self.harvestImage.center = CGPoint(x: self.emptyHarvestImageFrame.midX, y: self.emptyHarvestImageFrame.midY)
            self.degreaseImage.center = CGPoint(x: self.emptyDegreaseImageFrame.midX, y: self.emptyDegreaseImageFrame.midY)
            self.bleachImage.center = CGPoint(x: self.emptyBleachImageFrame.midX, y: self.emptyBleachImageFrame.midY)
            self.colourImage.center = CGPoint(x: self.emptyColourImageFrame.midX, y: self.emptyColourImageFrame.midY)
            
        }), completion: { (completion) -> Void in
            
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.goToNextScreen), userInfo: nil, repeats: false)
            
        })
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if nucleusImage.frame.contains(location) {
                isDraggingBlock = 1
                nucleusImage.center = location
            } else if nurtureImage.frame.contains(location) {
                isDraggingBlock = 2
                nurtureImage.center = location
            } else if harvestImage.frame.contains(location) {
                isDraggingBlock = 3
                harvestImage.center = location
            } else if degreaseImage.frame.contains(location) {
                isDraggingBlock = 4
                degreaseImage.center = location
            } else if bleachImage.frame.contains(location) {
                isDraggingBlock = 5
                bleachImage.center = location
            } else if colourImage.frame.contains(location) {
                isDraggingBlock = 6
                colourImage.center = location
            }
        
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if nucleusImage.frame.contains(location) && isDraggingBlock == 1 {
                nucleusImage.center = location
            } else if nurtureImage.frame.contains(location) && isDraggingBlock == 2 {
                nurtureImage.center = location
            } else if harvestImage.frame.contains(location) && isDraggingBlock == 3 {
                harvestImage.center = location
            } else if degreaseImage.frame.contains(location) && isDraggingBlock == 4 {
                degreaseImage.center = location
            } else if bleachImage.frame.contains(location) && isDraggingBlock == 5 {
                bleachImage.center = location
            } else if colourImage.frame.contains(location) && isDraggingBlock == 6 {
                colourImage.center = location
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isDraggingBlock = 0
        checkingForMatch()
        
    }
    
    @objc func continueButtonPressed() {
        
        playSound()
        
        var allAnswered = true
        if puzzleVar.contains(0) {
            allAnswered = false
        }
        
        if allAnswered {
            goToNextScreen()
        } else {
            animateAnswer()
        }
        
    }
    
    @objc func goToNextScreen() {
        
        playSound()
        
        self.removeFromSuperview()
        
        let transitionBriefProcessView = transitionBriefProcess(scene: self)
        PlaygroundPage.current.liveView = transitionBriefProcessView
    
    }
    
}
