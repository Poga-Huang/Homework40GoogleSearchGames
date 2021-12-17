//
//  CoinViewController.swift
//  Homework40GoogleSearchGames
//
//  Created by 黃柏嘉 on 2021/12/16.
//

import UIKit

class CoinViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var coinImageView: UIImageView!
    
    //兩種結果
    let resultArray = ["正面","反面"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    //執行
    @IBAction func execute(_ sender: UITapGestureRecognizer) {
        let randomNumber = Int.random(in: 0...1)
        coinImageView.image = UIImage(named: resultArray[randomNumber])
        resultLabel.text = resultArray[randomNumber]
    }
    
  

}
