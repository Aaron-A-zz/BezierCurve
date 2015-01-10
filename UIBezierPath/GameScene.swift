//
//  GameScene.swift
//  UIBezierPath
//
//  Created by Aaron Ackerman on 1/10/15.
//  Copyright (c) 2015 Mav3r1ck. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    // A. Create a SKSpriteNode
    var squareShape = SKSpriteNode(imageNamed: "Oval")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
       
        // B. Setting the background color
        backgroundColor = SKColor.whiteColor()
        // C. Setting position to the center of our view
        squareShape.position = CGPoint(x: size.width/2, y: size.height/2)
        
        
        //D. Add the SKSpriteNode to our GameScene
        addChild(squareShape)
    
    }
    
    // E. Creating a function for UIBezierPath to pass into the TouchesBegan
    func MoveSquare() {
        
        
        // F. Creating the UIBezierPath
        var bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(0.5, 0.5))
        bezierPath.addLineToPoint(CGPointMake(-190.5, 15.5))
        bezierPath.addLineToPoint(CGPointMake(-26.5, 15.5))
        bezierPath.addLineToPoint(CGPointMake(-26.5, 95.5))
        bezierPath.addLineToPoint(CGPointMake(-190.5, 95.5))
        bezierPath.addLineToPoint(CGPointMake(0.5, 0.5))
        
        // G. Creating a SKAction to Follow our UIBezierPath
        let actionMoveOne = SKAction.followPath(bezierPath.CGPath, duration: 6)

        // H. Adding the Action to our SKSpriteNode
        squareShape.runAction(SKAction.sequence([actionMoveOne]))
        
        
    }

    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        // I. Adding the Move Square Fuction so when the user taps the screen the square follows the path we set.
        MoveSquare()
    }
    
    
    
    
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
