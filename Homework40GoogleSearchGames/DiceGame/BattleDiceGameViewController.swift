//
//  BattleDiceGameViewController.swift
//  Homework40GoogleSearchGames
//
//  Created by 黃柏嘉 on 2021/12/16.
//

import UIKit

class BattleDiceGameViewController: UIViewController {
    
    @IBOutlet var CPUDiceImageArray: [UIImageView]!
    @IBOutlet var playerDiceImageArray: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    //擲骰子
    @IBAction func throwTheDice(_ sender: UIButton) {
        var CPUSum = 0
        var playerSum = 0
        for i in CPUDiceImageArray{
            let randomNumber = Int.random(in: 1...6)
            i.image = UIImage(named: "\(randomNumber)")
            CPUSum+=randomNumber
        }
        for j in playerDiceImageArray{
            let randomNumber = Int.random(in: 1...6)
            j.image = UIImage(named: "\(randomNumber)")
            playerSum+=randomNumber
        }
        if CPUSum == playerSum{
            alert(title: "雙方平手", message: "\(CPUSum)點對\(playerSum)點")
        }else if CPUSum > playerSum{
            alert(title: "玩家輸了", message: "\(CPUSum)點對\(playerSum)點")
        }else if CPUSum < playerSum{
            alert(title: "玩家勝利", message: "\(CPUSum)點對\(playerSum)點")
        }
    }
}
