//
//  ViewController.swift
//  Juggler
//
//  Created by 木村　洸太 on 2020/10/17.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var leverApp: UIButton!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var pekaImage: UIImageView!
    
    
    @IBOutlet weak var bigCountLabel: UILabel!
    @IBOutlet weak var regCountLabel: UILabel!
    @IBOutlet weak var slotCountLabel: UILabel!
    
    var count1 = Int()
    var count2 = Int()
    var count3 = Int()
    
    var bigCount = 0
    var regCount = 0
    var slotCount = 0
    
    var catCount1 = Int()
    var catCount2 = Int()
    
    var peka = 0
    
    var image = ImageList()
    
    var timer = TimerModel()
    
    var sound = SoundFile()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image1.image = image.list.randomElement()
        image2.image = image.list.randomElement()
        image3.image = image.list.randomElement()
        
        leverApp.isEnabled = true
        
        firstBtn.isEnabled = false
        secondBtn.isEnabled = false
        thirdBtn.isEnabled = false
        
        bigCountLabel.text = String(bigCount)
        regCountLabel.text = String(regCount)
        slotCountLabel.text = String(slotCount)
        
    }
    
    @IBAction func lever(_ sender: Any) {
        
        timer.startTimer1(image: image1)
        timer.startTimer2(image: image2)
        timer.startTimer3(image: image3)
        
        leverApp.isEnabled = false
        firstBtn.isEnabled = true
        secondBtn.isEnabled = false
        thirdBtn.isEnabled = false
        
        sound.playSound(filename: "ボタン音", extensionName: "mp3")
        
        slotCount = slotCount + 1
        slotCountLabel.text = String(slotCount)
        
    }
    
    @IBAction func first(_ sender: Any) {
        
        sound.playSound(filename: "ボタン音", extensionName: "mp3")
        
        if(peka == 1){
            
            timer.stopTimer1()
            image1.image = image.list[6]
            
            leverApp.isEnabled = false
            firstBtn.isEnabled = false
            secondBtn.isEnabled = true
            thirdBtn.isEnabled = false
            
            return
            
        }else if(peka == 2){
            
            timer.stopTimer1()
            image1.image = image.list[6]
            
            leverApp.isEnabled = false
            firstBtn.isEnabled = false
            secondBtn.isEnabled = true
            thirdBtn.isEnabled = false
            
            return
            
        }else{
        timer.stopTimer1()
        
        leverApp.isEnabled = false
        firstBtn.isEnabled = false
        secondBtn.isEnabled = true
        thirdBtn.isEnabled = false
        
        count1 = Int.random(in: 1..<5)
        catCount1 = Int.random(in: 1..<3)
            
        }
        
    }
    
    @IBAction func second(_ sender: Any) {
        
        sound.playSound(filename: "ボタン音", extensionName: "mp3")
        
        if(peka == 1){
            
            timer.stopTimer2()
            image2.image = image.list[6]
            
            leverApp.isEnabled = false
            firstBtn.isEnabled = false
            secondBtn.isEnabled = false
            thirdBtn.isEnabled = true
            
            return
            
        }else if(peka == 2){
            
            timer.stopTimer2()
            image2.image = image.list[6]
            
            leverApp.isEnabled = false
            firstBtn.isEnabled = false
            secondBtn.isEnabled = false
            thirdBtn.isEnabled = true
            
            return
            
        }else{
        
        timer.stopTimer2()
        
        leverApp.isEnabled = false
        firstBtn.isEnabled = false
        secondBtn.isEnabled = false
        thirdBtn.isEnabled = true
        
        count2 = Int.random(in: 1..<4)
        catCount2 = Int.random(in: 1..<4)
            
        }
    }
    
    @IBAction func third(_ sender: Any) {
        
        sound.playSound(filename: "ボタン音", extensionName: "mp3")
        
        if(peka == 1){
            
            timer.stopTimer3()
            image3.image = image.list[6]
            sound.playSound(filename: "やったー", extensionName: "mp3")
            
            peka = 0
            
            count3 = Int.random(in: 1..<4)
            
            pekaImage.isHidden = true
            
            leverApp.isEnabled = true
            firstBtn.isEnabled = false
            secondBtn.isEnabled = false
            thirdBtn.isEnabled = false
            
            bigCount = bigCount + 1
            bigCountLabel.text = String(bigCount)
            slotCount = 0
            slotCountLabel.text = String(slotCount)
            
            return
            
        }else if(peka == 2){
            
            timer.stopTimer3()
            image3.image = image.list[3]
            sound.playSound(filename: "残念", extensionName: "mp3")
            
            peka = 0
            
            count3 = Int.random(in: 1..<4)
            
            pekaImage.isHidden = true
            
            leverApp.isEnabled = true
            firstBtn.isEnabled = false
            secondBtn.isEnabled = false
            thirdBtn.isEnabled = false
            
            regCount = regCount + 1
            regCountLabel.text = String(regCount)
            slotCount = 0
            slotCountLabel.text = String(slotCount)
            
        }else{
        
        count3 = Int.random(in: 1..<4)
            
        
        if (count1 == count2 && count1 == count3 && catCount1 != catCount2){
            
            timer.stopTimer3()
            
            peka = Int.random(in: 1..<3)
            
            pekaImage.isHidden = false
            pekaImage.image = UIImage(named: "ペカ")
            
            sound.playSound(filename: "ペカリ音", extensionName: "mp3")
            
            leverApp.isEnabled = true
            firstBtn.isEnabled = false
            secondBtn.isEnabled = false
            thirdBtn.isEnabled = false
            
            
        }else if(count1 == count2 && count1 == count3 && catCount1 == catCount2){
            
            timer.stopTimer3()
            
            peka = 1
            
            pekaImage.isHidden = false
            pekaImage.image = UIImage(named: "gogoCat")
            
            sound.playSound(filename: "鳴き声", extensionName: "mp3")
            
            leverApp.isEnabled = true
            firstBtn.isEnabled = false
            secondBtn.isEnabled = false
            thirdBtn.isEnabled = false
            
            
        }else{
        
        timer.stopTimer3()
        
        leverApp.isEnabled = true
        firstBtn.isEnabled = false
        secondBtn.isEnabled = false
        thirdBtn.isEnabled = false
        
        //count3 = Int.random(in: 1..<3)
        }
        
        }
    }
    
}

