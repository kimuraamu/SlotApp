//
//  SoundFile.swift
//  Juggler
//
//  Created by 木村　洸太 on 2020/10/17.
//

import Foundation
import AVFoundation

class SoundFile{
    
    var player:AVAudioPlayer?
    
    func playSound(filename:String,extensionName:String){
        
        
        //再生する
        let soundURL = Bundle.main.url(forResource: filename, withExtension: extensionName)
        
        do {
            //効果音を鳴らす
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        } catch  {
            
            print("エラーです")
        }
    }
    
}

