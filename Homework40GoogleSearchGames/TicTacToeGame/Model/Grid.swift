//
//  Grid.swift
//  Homework40GoogleSearchGames
//
//  Created by 黃柏嘉 on 2021/12/17.
//

import UIKit
enum Piece{
    case o
    case x
}
class Grid{
    let squareCount = 9
    lazy var squares = [Piece?](repeating: nil, count: squareCount)
    let lines = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                         [0, 3, 6], [1, 4, 7], [2, 5, 8],
                         [0, 4, 8], [2, 4, 6]]
    //用迴圈將8種會勝利的連法一個一個拿出來檢查，先從squares中拿出每條線上的第一個o或x，然後檢查他與剩下的第二第三點是否相同，如果有一個等於true代表那個o或x是贏家
    var winner:Piece?{
        var winner:Piece?
        for line in lines {
            if let firstPiece = squares[line[0]]{
                let result = line.allSatisfy { (index)->Bool in
                    return squares[index] == firstPiece
                }
                if result{
                    winner = firstPiece
                    break
                }
            }
        }
        return winner
    }
    //與上面一樣方法，找到是哪種連法連成一線
    var winnerLines: [[Int]] {
        var winnerLines = [[Int]]()
        for line in lines {
            if let firstPiece = squares[line[0]] {
                let result = line.allSatisfy { (index) -> Bool in
                    return squares[index] == firstPiece
                }
                if result {
                    winnerLines.append(line)
                }
            }
        }
        return winnerLines
    }
    //是否全滿用{get}取得，只要要使用isFull就開始找，squares裡面全部有沒有空的，沒有就是isFull=true
    var isFull: Bool {
        return squares.indices.allSatisfy { (index) -> Bool in
            return isSquareEmpty(index: index) == false
        }
    }
    //看有沒有平手，全滿又加上沒有贏家，一樣用{get}取得
    var isTie: Bool {
        if isFull, winner == nil {
            return true
        } else {
            return false
        }
    }
    //看有沒有空的，進去squares裡找，有沒有哪格是不是nil
    func isSquareEmpty(index: Int) -> Bool {
        return squares[index] == nil
    }
    //目前讓目前哪格成為o或x
    func occupy(piece: Piece, on index: Int) {
        squares[index] = piece
    }
    
    //全部清空
    func clear() {
        squares = [Piece?](repeating: nil, count: squareCount)
    }
}
