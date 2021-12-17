//
//  GamesListCollectionViewController.swift
//  Homework40GoogleSearchGames
//
//  Created by 黃柏嘉 on 2021/12/15.
//

import UIKit

private let reuseIdentifier = "gameItem"

class GamesMenuCollectionViewController: UICollectionViewController {
    
    let gamesArray = ["銅板遊戲","骰子遊戲","圈圈叉叉","輪盤遊戲"]

    override func viewDidLoad() {
        super.viewDidLoad()

       configureCellSize()
        
    }
    
    func configureCellSize(){
        let itemSpace: CGFloat = 10
        let columnCount: CGFloat = 2
               
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
               
        let width = floor((collectionView.bounds.width - itemSpace * (columnCount-1)) / columnCount)
        
        flowLayout?.itemSize = CGSize(width: width, height: width)
        flowLayout?.estimatedItemSize = .zero
        flowLayout?.sectionInset = UIEdgeInsets(top: collectionView.bounds.height*200/896, left: 0, bottom: 0, right: 0)
        flowLayout?.minimumInteritemSpacing = itemSpace
        flowLayout?.minimumLineSpacing = itemSpace
    }
  
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return gamesArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GameMenuCollectionViewCell
        cell.gameNameLabel.text = gamesArray[indexPath.item]
        cell .gameImageView.image = UIImage(named: "\(gamesArray[indexPath.item])")
        
        return cell
    }
    
    
    //UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //點擊後跳轉至不同遊戲畫面
        switch indexPath.item{
        case 0:
            performSegue(withIdentifier: "showCoinGame", sender: nil)
        case 1:
            performSegue(withIdentifier: "showDiceGame", sender: nil)
        case 2:
            performSegue(withIdentifier: "showTicTacToeGame", sender: nil)
        case 3:
            performSegue(withIdentifier: "showSpinnerGame", sender: nil)
        default:
            return
        }
    }
 

}
