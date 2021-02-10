//
//  TimerModel.swift
//  Juggler
//
//  Created by 木村　洸太 on 2020/10/17.
//

import Foundation
import UIKit

class TimerModel: UIViewController{
    
    //timerにTimerオブジェクトを保持
    var timer1 = Timer()
    var timer2 = Timer()
    var timer3 = Timer()
    
    var images = ImageList()
    
    //var image:UIImageView!
    
    var count = 0
    
    
    //タイマーを個別で回す
    func startTimer1(image:UIImageView!){
        
        //タイマーを回す　0.1秒毎にあるメソッドを呼ぶ
        timer1 = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerUpdate(_:)), userInfo: image, repeats: true)
    }
    
    func startTimer2(image:UIImageView!){
        
        //タイマーを回す　0.1秒毎にあるメソッドを呼ぶ
        timer2 = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerUpdate(_:)), userInfo: image, repeats: true)
    }
    
    func startTimer3(image:UIImageView!){
        
        //タイマーを回す　0.1秒毎にあるメソッドを呼ぶ
        timer3 = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerUpdate(_:)), userInfo: image, repeats: true)
    }
    
    //0.1秒毎に呼ばれるメソッド
    @objc func timerUpdate(_ sender: Timer){
        
        let imageView = sender.userInfo as! UIImageView //userInfoはUIImageViewとして設定
        
        count = count + 1
        
        if(count > 6){
            count = 0
        }
        
        imageView.image = images.list[count]
    }

    //タイマーを個別に止める
    func stopTimer1(){
        
        timer1.invalidate()
    }
    
    func stopTimer2(){
        
        timer2.invalidate()
    }
    
    func stopTimer3(){
        
        timer3.invalidate()
    }
}
