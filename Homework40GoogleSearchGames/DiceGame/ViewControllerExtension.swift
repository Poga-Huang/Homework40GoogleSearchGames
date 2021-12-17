//
//  ViewControllerExtension.swift
//  Homework40GoogleSearchGames
//
//  Created by 黃柏嘉 on 2021/12/16.
//

import UIKit

extension UIViewController{
    func alert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .default) { closeAction in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(closeAction)
        present(alert, animated: true, completion: nil)
    }
}
