import Foundation
import UIKit
import PlaygroundSupport

public class comprehensiveProcess: UIView {

    let directionLabel = UILabel()
    
    let backgroundImage = UIImageView()
    
    let nucleusImage = UIImageView()
    let nurtureImage = UIImageView()
    let harvestImage = UIImageView()
    let degreaseImage = UIImageView()
    let colourImage = UIImageView()
    
    let stepToNucleus1 = UIImageView()
    let stepToNucleus2 = UIImageView()
    let stepToNucleus3 = UIImageView()
    let stepToNucleus4 = UIImageView()
    let stepToNucleus5 = UIImageView()
    let stepToNucleus6 = UIImageView()
    let stepToNucleus7 = UIImageView()
    let stepToNucleus8 = UIImageView()
    let stepToNucleus9 = UIImageView()
    
    let stepToNurture1 = UIImageView()
    let stepToNurture2 = UIImageView()
    let stepToNurture3 = UIImageView()
    let stepToNurture4 = UIImageView()
    let stepToNurture5 = UIImageView()
    
    let stepToHarvest1 = UIImageView()
    let stepToHarvest2 = UIImageView()
    
    let stepToDegrease1 = UIImageView()
    let stepToDegrease2 = UIImageView()
    let stepToDegrease3 = UIImageView()
    let stepToDegrease4 = UIImageView()
    let stepToDegrease5 = UIImageView()
    
    let stepToColour1 = UIImageView()
    let stepToColour2 = UIImageView()
    let stepToColour3 = UIImageView()
    let stepToColour4 = UIImageView()
    let stepToColour5 = UIImageView()
    
    let nucleusButton = UIButton()
    let nurtureButton = UIButton()
    let harvestButton = UIButton()
    let degreaseButton = UIButton()
    let colourButton = UIButton()
    
    var timer = Timer()
    
    public init(scene: UIView, stage: Int) {
        super.init(frame:CGRect(x: 0, y: 0, width: 500, height: 500))
        setupUI()
        loadSteps()
        if stage == 0 {
            stageNucleus()
        } else if stage == 1 {
            stageNurture()
        } else if stage == 2 {
            stageHarvest()
        } else if stage == 3 {
            stageDegrease()
        } else if stage == 4 {
            stageColour()
        } else if stage == 5 {
            goToNextScreen()
        }
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setupUI() {
        let cfURL = Bundle.main.url(forResource: "DancingScript", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(cfURL! as CFURL, CTFontManagerScope.process, nil)
        
        self.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        self.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        
        backgroundImage.image = UIImage(named: "minimal_background.jpg")
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.alpha = 0.7
        self.addSubview(backgroundImage)
        
        nucleusImage.image = UIImage(named: "nucleus_implanting_process.jpeg")
        nucleusImage.frame = CGRect(x: 33.5, y: 353, width: 88, height: 68)
        nucleusImage.contentMode = .scaleAspectFit
        nucleusImage.isHidden = true
        self.addSubview(nucleusImage)
        
        nurtureImage.image = UIImage(named: "nurturing_process.jpeg")
        nurtureImage.frame = CGRect(x: 93, y: 182, width: 88, height: 68)
        nurtureImage.contentMode = .scaleAspectFit
        nurtureImage.isHidden = true
        self.addSubview(nurtureImage)
        
        harvestImage.image = UIImage(named: "harvesting_process.jpeg")
        harvestImage.frame = CGRect(x: 250, y: 182, width: 88, height: 68)
        harvestImage.contentMode = .scaleAspectFit
        harvestImage.isHidden = true
        self.addSubview(harvestImage)
        
        degreaseImage.image = UIImage(named: "degreasing_process.jpeg")
        degreaseImage.frame = CGRect(x: 375, y: 290, width: 88, height: 68)
        degreaseImage.contentMode = .scaleAspectFit
        degreaseImage.isHidden = true
        self.addSubview(degreaseImage)
        
        colourImage.image = UIImage(named: "colouring_process.jpeg")
        colourImage.frame = CGRect(x: 375, y: 75, width: 88, height: 68)
        colourImage.contentMode = .scaleAspectFit
        colourImage.isHidden = true
        self.addSubview(colourImage)
        
        nucleusButton.frame = CGRect(x: 33.5, y: 353, width: 88, height: 68)
        nucleusButton.addTarget(self, action: #selector(nucleusButtonPressed), for: .touchUpInside)
        nucleusButton.isHidden = true
        self.addSubview(nucleusButton)
        
        nurtureButton.frame = CGRect(x: 93, y: 182, width: 88, height: 68)
        nurtureButton.addTarget(self, action: #selector(nurtureButtonPressed), for: .touchUpInside)
        nurtureButton.isHidden = true
        self.addSubview(nurtureButton)
        
        harvestButton.frame = CGRect(x: 250, y: 182, width: 88, height: 68)
        harvestButton.addTarget(self, action: #selector(harvestButtonPressed), for: .touchUpInside)
        harvestButton.isHidden = true
        self.addSubview(harvestButton)
        
        degreaseButton.frame = CGRect(x: 375, y: 290, width: 88, height: 68)
        degreaseButton.addTarget(self, action: #selector(degreaseButtonPressed), for: .touchUpInside)
        degreaseButton.isHidden = true
        self.addSubview(degreaseButton)
        
        colourButton.frame = CGRect(x: 375, y: 75, width: 88, height: 68)
        colourButton.addTarget(self, action: #selector(colourButtonPressed), for: .touchUpInside)
        colourButton.isHidden = true
        self.addSubview(colourButton)
        
        directionLabel.text = "Comprehensive process flow"
        directionLabel.frame = CGRect(x: 20, y: 10, width: 350, height: 100)
        directionLabel.textColor = UIColor.black
        directionLabel.font = UIFont(name: "DancingScript-Regular", size: 32)
        self.addSubview(directionLabel)
    }
    
    func loadSteps() {
        
        stepToNucleus1.image =  UIImage(named: "shoe_steps_right.png")
        stepToNucleus1.frame = CGRect(x: 25 , y: 445, width: 20, height: 20)
        stepToNucleus1.contentMode = .scaleAspectFit
        stepToNucleus1.isHidden = true
        self.addSubview(stepToNucleus1)
        
        stepToNucleus2.image =  UIImage(named: "shoe_steps_right.png")
        stepToNucleus2.frame = CGRect(x: 55, y: 445, width: 20, height: 20)
        stepToNucleus2.contentMode = .scaleAspectFit
        stepToNucleus2.isHidden = true
        self.addSubview(stepToNucleus2)
        
        stepToNucleus3.image =  UIImage(named: "shoe_steps_right.png")
        stepToNucleus3.frame = CGRect(x: 85, y: 445, width: 20, height: 20)
        stepToNucleus3.contentMode = .scaleAspectFit
        stepToNucleus3.isHidden = true
        self.addSubview(stepToNucleus3)
        
        stepToNucleus4.image =  UIImage(named: "shoe_steps_right.png")
        stepToNucleus4.frame = CGRect(x: 115, y: 445, width: 20, height: 20)
        stepToNucleus4.contentMode = .scaleAspectFit
        stepToNucleus4.isHidden = true
        self.addSubview(stepToNucleus4)
        
        stepToNucleus5.image =  UIImage(named: "shoe_steps_right.png")
        stepToNucleus5.frame = CGRect(x: 145, y: 445, width: 20, height: 20)
        stepToNucleus5.contentMode = .scaleAspectFit
        stepToNucleus5.isHidden = true
        self.addSubview(stepToNucleus5)
        
        stepToNucleus6.image =  UIImage(named: "shoe_steps_forward.png")
        stepToNucleus6.frame = CGRect(x: 175, y: 435, width: 20, height: 20)
        stepToNucleus6.contentMode = .scaleAspectFit
        stepToNucleus6.transform = CGAffineTransform(rotationAngle: 45)
        stepToNucleus6.isHidden = true
        self.addSubview(stepToNucleus6)
        
        stepToNucleus7.image =  UIImage(named: "shoe_steps_forward.png")
        stepToNucleus7.frame = CGRect(x: 175, y: 405, width: 20, height: 20)
        stepToNucleus7.contentMode = .scaleAspectFit
        stepToNucleus7.isHidden = true
        self.addSubview(stepToNucleus7)
        
        stepToNucleus8.image =  UIImage(named: "shoe_steps_left.png")
        stepToNucleus8.frame = CGRect(x: 165, y: 375, width: 20, height: 20)
        stepToNucleus8.contentMode = .scaleAspectFit
        stepToNucleus8.transform = CGAffineTransform(rotationAngle: -45)
        stepToNucleus8.isHidden = true
        self.addSubview(stepToNucleus8)
        
        stepToNucleus9.image = UIImage(named: "shoe_steps_left.png")
        stepToNucleus9.frame = CGRect(x: 135, y: 365, width: 20, height: 20)
        stepToNucleus9.transform = CGAffineTransform(rotationAngle: -45)
        stepToNucleus9.contentMode = .scaleAspectFit
        stepToNucleus9.isHidden = true
        self.addSubview(stepToNucleus9)
        
        stepToNurture1.image = UIImage(named: "shoe_steps_left.png")
        stepToNurture1.frame = CGRect(x: 65, y: 330, width: 20, height: 20)
        stepToNurture1.contentMode = .scaleAspectFit
        stepToNurture1.isHidden = true
        self.addSubview(stepToNurture1)
        
        stepToNurture2.image = UIImage(named: "shoe_steps_forward.png")
        stepToNurture2.frame = CGRect(x: 65, y: 300, width: 20, height: 20)
        stepToNurture2.contentMode = .scaleAspectFit
        stepToNurture2.isHidden = true
        self.addSubview(stepToNurture2)
        
        stepToNurture3.image = UIImage(named: "shoe_steps_forward.png")
        stepToNurture3.frame = CGRect(x: 65, y: 270, width: 20, height: 20)
        stepToNurture3.contentMode = .scaleAspectFit
        stepToNurture3.isHidden = true
        self.addSubview(stepToNurture3)
        
        stepToNurture4.image = UIImage(named: "shoe_steps_forward.png")
        stepToNurture4.frame = CGRect(x: 65, y: 240, width: 20, height: 20)
        stepToNurture4.contentMode = .scaleAspectFit
        stepToNurture4.isHidden = true
        self.addSubview(stepToNurture4)
        
        stepToNurture5.image = UIImage(named: "shoe_steps_forward.png")
        stepToNurture5.frame = CGRect(x: 65, y: 210, width: 20, height: 20)
        stepToNurture5.contentMode = .scaleAspectFit
        stepToNurture5.transform = CGAffineTransform(rotationAngle: 45)
        stepToNurture5.isHidden = true
        self.addSubview(stepToNurture5)
        
        stepToHarvest1.image = UIImage(named: "shoe_steps_right.png")
        stepToHarvest1.frame = CGRect(x: 190, y: 205, width: 20, height: 20)
        stepToHarvest1.contentMode = .scaleAspectFit
        stepToHarvest1.isHidden = true
        self.addSubview(stepToHarvest1)
        
        stepToHarvest2.image = UIImage(named: "shoe_steps_right.png")
        stepToHarvest2.frame = CGRect(x: 220, y: 205, width: 20, height: 20)
        stepToHarvest2.contentMode = .scaleAspectFit
        stepToHarvest2.isHidden = true
        self.addSubview(stepToHarvest2)
        
        stepToDegrease1.image = UIImage(named: "shoe_steps_back.png")
        stepToDegrease1.frame = CGRect(x: 285, y: 255, width: 20, height: 20)
        stepToDegrease1.contentMode = .scaleAspectFit
        stepToDegrease1.isHidden = true
        self.addSubview(stepToDegrease1)
        
        stepToDegrease2.image = UIImage(named: "shoe_steps_back.png")
        stepToDegrease2.frame = CGRect(x: 285, y: 285, width: 20, height: 20)
        stepToDegrease2.contentMode = .scaleAspectFit
        stepToDegrease2.isHidden = true
        self.addSubview(stepToDegrease2)
        
        stepToDegrease3.image = UIImage(named: "shoe_steps_right.png")
        stepToDegrease3.frame = CGRect(x: 285, y: 315, width: 20, height: 20)
        stepToDegrease3.transform = CGAffineTransform(rotationAngle: 45)
        stepToDegrease3.contentMode = .scaleAspectFit
        stepToDegrease3.isHidden = true
        self.addSubview(stepToDegrease3)
        
        stepToDegrease4.image = UIImage(named: "shoe_steps_right.png")
        stepToDegrease4.frame = CGRect(x: 315, y: 315, width: 20, height: 20)
        stepToDegrease4.contentMode = .scaleAspectFit
        stepToDegrease4.isHidden = true
        self.addSubview(stepToDegrease4)
        
        stepToDegrease5.image = UIImage(named: "shoe_steps_right.png")
        stepToDegrease5.frame = CGRect(x: 345, y: 315, width: 20, height: 20)
        stepToDegrease5.contentMode = .scaleAspectFit
        stepToDegrease5.isHidden = true
        self.addSubview(stepToDegrease5)
        
        stepToColour1.image = UIImage(named: "shoe_steps_forward.png")
        stepToColour1.frame = CGRect(x: 407, y: 267, width: 20, height: 20)
        stepToColour1.contentMode = .scaleAspectFit
        stepToColour1.isHidden = true
        self.addSubview(stepToColour1)
        
        stepToColour2.image = UIImage(named: "shoe_steps_forward.png")
        stepToColour2.frame = CGRect(x: 407, y: 237, width: 20, height: 20)
        stepToColour2.contentMode = .scaleAspectFit
        stepToColour2.isHidden = true
        self.addSubview(stepToColour2)
        
        stepToColour3.image = UIImage(named: "shoe_steps_forward.png")
        stepToColour3.frame = CGRect(x: 407, y: 207, width: 20, height: 20)
        stepToColour3.contentMode = .scaleAspectFit
        stepToColour3.isHidden = true
        self.addSubview(stepToColour3)
        
        stepToColour4.image = UIImage(named: "shoe_steps_forward.png")
        stepToColour4.frame = CGRect(x: 407, y: 177, width: 20, height: 20)
        stepToColour4.contentMode = .scaleAspectFit
        stepToColour4.isHidden = true
        self.addSubview(stepToColour4)
        
        stepToColour5.image = UIImage(named: "shoe_steps_forward.png")
        stepToColour5.frame = CGRect(x: 407, y: 147, width: 20, height: 20)
        stepToColour5.contentMode = .scaleAspectFit
        stepToColour5.isHidden = true
        self.addSubview(stepToColour5)
        
    }
    
    func stageNucleus() {
        
        var countVar = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (time) in
            if countVar == 0 {
                self.stepToNucleus1.isHidden = false
            } else if countVar == 1 {
                self.stepToNucleus2.isHidden = false
            } else if countVar == 2 {
                self.stepToNucleus3.isHidden = false
            } else if countVar == 3 {
                self.stepToNucleus4.isHidden = false
            } else if countVar == 4 {
                self.stepToNucleus5.isHidden = false
            } else if countVar == 5 {
                self.stepToNucleus6.isHidden = false
            } else if countVar == 6 {
                self.stepToNucleus7.isHidden = false
            } else if countVar == 7 {
                self.stepToNucleus8.isHidden = false
            } else if countVar == 8 {
                self.stepToNucleus9.isHidden = false
            } else {
                self.nucleusImage.isHidden = false
                self.nucleusButton.isHidden = false
                self.timer.invalidate()
            }
            countVar += 1
        }
    }
        
    func stageNurture() {
        
        var countVar = 0
        self.stepToNucleus1.isHidden = false
        self.stepToNucleus2.isHidden = false
        self.stepToNucleus3.isHidden = false
        self.stepToNucleus4.isHidden = false
        self.stepToNucleus5.isHidden = false
        self.stepToNucleus6.isHidden = false
        self.stepToNucleus7.isHidden = false
        self.stepToNucleus8.isHidden = false
        self.stepToNucleus9.isHidden = false
        self.nucleusImage.isHidden = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (time) in
            if countVar == 0 {
                self.stepToNurture1.isHidden = false
            } else if countVar == 1 {
                self.stepToNurture2.isHidden = false
            } else if countVar == 2 {
                self.stepToNurture3.isHidden = false
            } else if countVar == 3 {
                self.stepToNurture4.isHidden = false
            } else if countVar == 4 {
                self.stepToNurture5.isHidden = false
            } else {
                self.nurtureImage.isHidden = false
                self.nurtureButton.isHidden = false
                self.timer.invalidate()
            }
            countVar += 1
        })
    }
    
    func stageHarvest() {
        
        var countVar = 0
        
        self.stepToNucleus1.isHidden = false
        self.stepToNucleus2.isHidden = false
        self.stepToNucleus3.isHidden = false
        self.stepToNucleus4.isHidden = false
        self.stepToNucleus5.isHidden = false
        self.stepToNucleus6.isHidden = false
        self.stepToNucleus7.isHidden = false
        self.stepToNucleus8.isHidden = false
        self.stepToNucleus9.isHidden = false
        self.nucleusImage.isHidden = false
        
        self.stepToNurture1.isHidden = false
        self.stepToNurture2.isHidden = false
        self.stepToNurture3.isHidden = false
        self.stepToNurture4.isHidden = false
        self.stepToNurture5.isHidden = false
        self.nurtureImage.isHidden = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (time) in
            if countVar == 0 {
                self.stepToHarvest1.isHidden = false
            } else if countVar == 1 {
                self.stepToHarvest2.isHidden = false
            } else {
                self.harvestImage.isHidden = false
                self.harvestButton.isHidden = false
                self.timer.invalidate()
            }
            countVar += 1
        })
    }
    
    func stageDegrease() {
        
        var countVar = 0
        
        self.stepToNucleus1.isHidden = false
        self.stepToNucleus2.isHidden = false
        self.stepToNucleus3.isHidden = false
        self.stepToNucleus4.isHidden = false
        self.stepToNucleus5.isHidden = false
        self.stepToNucleus6.isHidden = false
        self.stepToNucleus7.isHidden = false
        self.stepToNucleus8.isHidden = false
        self.stepToNucleus9.isHidden = false
        self.nucleusImage.isHidden = false
        
        self.stepToNurture1.isHidden = false
        self.stepToNurture2.isHidden = false
        self.stepToNurture3.isHidden = false
        self.stepToNurture4.isHidden = false
        self.stepToNurture5.isHidden = false
        self.nurtureImage.isHidden = false
        
        self.stepToHarvest1.isHidden = false
        self.stepToHarvest2.isHidden = false
        self.harvestImage.isHidden = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (time) in
            if countVar == 0 {
                self.stepToDegrease1.isHidden = false
            } else if countVar == 1 {
                self.stepToDegrease2.isHidden = false
            } else if countVar == 2 {
                self.stepToDegrease3.isHidden = false
            } else if countVar == 3 {
                self.stepToDegrease4.isHidden = false
            } else if countVar == 4 {
                self.stepToDegrease5.isHidden = false
            } else {
                self.degreaseImage.isHidden = false
                self.degreaseButton.isHidden = false
                self.timer.invalidate()
            }
            countVar += 1
        })
    }
    
    func stageColour() {
        
        var countVar = 0
        
        self.stepToNucleus1.isHidden = false
        self.stepToNucleus2.isHidden = false
        self.stepToNucleus3.isHidden = false
        self.stepToNucleus4.isHidden = false
        self.stepToNucleus5.isHidden = false
        self.stepToNucleus6.isHidden = false
        self.stepToNucleus7.isHidden = false
        self.stepToNucleus8.isHidden = false
        self.stepToNucleus9.isHidden = false
        self.nucleusImage.isHidden = false
        
        self.stepToNurture1.isHidden = false
        self.stepToNurture2.isHidden = false
        self.stepToNurture3.isHidden = false
        self.stepToNurture4.isHidden = false
        self.stepToNurture5.isHidden = false
        self.nurtureImage.isHidden = false
        
        self.stepToHarvest1.isHidden = false
        self.stepToHarvest2.isHidden = false
        self.harvestImage.isHidden = false
        
        self.stepToDegrease1.isHidden = false
        self.stepToDegrease2.isHidden = false
        self.stepToDegrease3.isHidden = false
        self.stepToDegrease4.isHidden = false
        self.stepToDegrease5.isHidden = false
        self.degreaseImage.isHidden = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (time) in
            if countVar == 0 {
                self.stepToColour1.isHidden = false
            } else if countVar == 1 {
                self.stepToColour2.isHidden = false
            } else if countVar == 2 {
                self.stepToColour3.isHidden = false
            } else if countVar == 3 {
                self.stepToColour4.isHidden = false
            } else if countVar == 4 {
                self.stepToColour5.isHidden = false
            } else {
                self.colourImage.isHidden = false
                self.colourButton.isHidden = false
                self.timer.invalidate()
            }
            countVar += 1
        })
    }
    
    @objc func nucleusButtonPressed() {
        
        self.removeFromSuperview()
               
        let nucluesImplantingView = nucleusImplanting(scene: self)
        PlaygroundPage.current.liveView = nucluesImplantingView
        
    }
    
    @objc func nurtureButtonPressed() {
        
        self.removeFromSuperview()
        
        let nurturingView = nurturing(scene: self)
        PlaygroundPage.current.liveView = nurturingView
  
    }
    
    @objc func harvestButtonPressed() {
        
        self.removeFromSuperview()
              
        let harvestingView = harvesting(scene: self)
        PlaygroundPage.current.liveView = harvestingView
        
    }
    
    @objc func degreaseButtonPressed() {
        
        self.removeFromSuperview()
        
        let degreasingView = degreasing(scene: self)
        PlaygroundPage.current.liveView = degreasingView
      
    }
    
    @objc func colourButtonPressed() {
        
        self.removeFromSuperview()
               
        let colouringView = colouring(scene: self)
        PlaygroundPage.current.liveView = colouringView
   
    }
    
    func goToNextScreen() {
        
        self.removeFromSuperview()
        
        let thankYouView = thankYou(scene: self)
        PlaygroundPage.current.liveView = thankYouView
    
    }
    
}
