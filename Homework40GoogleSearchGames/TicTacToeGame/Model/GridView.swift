//
//  GridView.swift
//  Homework40GoogleSearchGames
//
//  Created by 黃柏嘉 on 2021/12/17.
//

import UIKit

class GridView:UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let squareWidth:CGFloat = 110
        let lineWidth:CGFloat = 12.5
        
        var y = squareWidth + lineWidth/2
        path.move(to: CGPoint(x: 0, y: y))
        path.addLine(to: CGPoint(x: rect.width, y: y))
        
        y += squareWidth+lineWidth
        path.move(to: CGPoint(x: 0, y: y))
        path.addLine(to: CGPoint(x: rect.width, y: y))
        
        var x = squareWidth + lineWidth/2
        path.move(to: CGPoint(x: x, y: 0))
        path.addLine(to: CGPoint(x: x, y: rect.height))
        
        x += squareWidth+lineWidth
        path.move(to: CGPoint(x: x, y: 0))
        path.addLine(to: CGPoint(x: x, y: rect.height))
        
        path.lineWidth = lineWidth
        UIColor.red.setStroke()
        path.stroke()
    }
}
