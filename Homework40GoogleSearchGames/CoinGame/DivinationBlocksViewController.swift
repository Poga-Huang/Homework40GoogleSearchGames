//
//  DivinationBlocksViewController.swift
//  Homework40GoogleSearchGames
//
//  Created by 黃柏嘉 on 2021/12/16.
//

import UIKit

struct resultData{
    var resultName:String
    var resultMean:String
}

class DivinationBlocksViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var divinationBlocksImageView: UIImageView!
    let resultArray = [
        resultData(resultName: "聖筊", resultMean: "好,可以,沒問題"),
        resultData(resultName: "笑筊", resultMean: "發問不夠清楚,重新發問"),
        resultData(resultName: "陰筊", resultMean: "不行沒辦法")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func execute(_ sender: UITapGestureRecognizer) {
        let randomNumber = Int.random(in: 0...2)
        divinationBlocksImageView.image = UIImage(named: resultArray[randomNumber].resultName)
        resultLabel.text = resultArray[randomNumber].resultName + "\n" + resultArray[randomNumber].resultMean
    }
    
  
}
