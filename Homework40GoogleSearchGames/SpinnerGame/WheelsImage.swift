//
//  WheelsImage.swift
//  Homework40GoogleSearchGames
//
//  Created by 黃柏嘉 on 2021/12/17.
//

import UIKit

class WheelsImage: UIImageView {

    var currentValue:Double = 0
    
    func rotate(handler:@escaping (String)->()){
        var result = "" // 紀錄結果名稱
        let randomDoubleNumber = Double.random(in: 0..<Double.pi*2)//隨機產生0~360度的亂數
        //使用CABasicAnimation
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        CATransaction.begin()
        animation.fromValue = currentValue
        currentValue += 100*Double.pi*2+randomDoubleNumber//總共旋轉角度是50圈加上隨機角度
        let value = currentValue.truncatingRemainder(dividingBy: Double.pi*2)//跟360的餘數就是轉的角度
        let degree = value*180/Double.pi//弧度轉為角度
        //判斷角度
        switch degree{
        case 0..<22.5:
            result = "$100"
        case 22.5..<67.5:
            result = "$800"
        case 67.5..<112.5:
            result = "$700"
        case 112.5..<157.5:
            result = "$600"
        case 157.5..<202.5:
            result = "$500"
        case 202.5..<247.5:
            result = "$400"
        case 247.5..<292.5:
            result = "$300"
        case 292.5..<337.5:
            result = "$200"
        case 337.5..<360:
            result = "$100"
        default:
            result = "恭喜你轉到最大獎,$1000"
        }
        animation.toValue = currentValue
        //動畫結束後不回歸原始狀態，而是停在原地
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        //動畫時長
        animation.duration = 3
        //只做一次
        animation.repeatCount = 1
        //延遲通知
        CATransaction.setCompletionBlock {
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                handler(result)
            }
        }
        //加入動畫
        self.layer.add(animation, forKey: nil)
        CATransaction.commit()
        
    }

}
