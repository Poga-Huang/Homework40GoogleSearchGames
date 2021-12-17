//
//  PersonalDiceGameViewController.swift
//  Homework40GoogleSearchGames
//
//  Created by 黃柏嘉 on 2021/12/16.
//

import UIKit

class PersonalDiceGameViewController: UIViewController {

    @IBOutlet weak var quantitySegmentedControl: UISegmentedControl!
    @IBOutlet var diceArray: [UIImageView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //選擇數量
    @IBAction func changeDiceQuantity(_ sender: UISegmentedControl) {
        //取得使用者選擇數量
        let selectQuantity = sender.selectedSegmentIndex
        //先判斷是否是選擇最多的，不是的話用迴圈將在範圍內的都拿出來顯示，剩下的為0
        if selectQuantity < 5{
            for i in 0...selectQuantity{
                diceArray[i].alpha = 1
            }
            for i in selectQuantity+1...5{
                diceArray[i].alpha = 0
            }
        }else{
            //如果點選最多的就全部顯示
            for i in diceArray{
                i.alpha = 1
            }
        }
    }
    //躑骰子
    @IBAction func throwTheDice(_ sender: UITapGestureRecognizer) {
        var sum = 0
        let selectQuantity = quantitySegmentedControl.selectedSegmentIndex
        for i in 0...selectQuantity{
            let random = Int.random(in: 1...6)
            diceArray[i].image = UIImage(named: "\(random)")
            sum += random
            }
        alert(title: "恭喜", message: "骰到\(sum)點")
    }
    
}
