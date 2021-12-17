//
//  infoView.swift
//  Homework40GoogleSearchGames
//
//  Created by 黃柏嘉 on 2021/12/17.
//

import UIKit

class InfoView:UIView{
    
    @IBOutlet weak var infoTextLabel:UILabel!
    
    //跳出資訊欄
    func show(text: String) {
        infoTextLabel.text = text
        superview?.bringSubviewToFront(self)
        let animator = UIViewPropertyAnimator(duration: 1, curve: .easeIn) {
            self.center = self.superview!.center
        }
        animator.startAnimation()
    }
    //收起資訊欄
    func close(){
        let animator = UIViewPropertyAnimator(duration: 1, curve: .easeIn) {
            self.frame.origin.y = self.superview!.frame.maxY
        }
        animator.addCompletion { (_) in
            self.frame.origin.y = -self.frame.height
        }
        animator.startAnimation()
    }
    //設定資訊欄外觀
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        layer.borderWidth = 5
        layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
