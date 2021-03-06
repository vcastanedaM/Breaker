import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ball:SKSpriteNode!
    var paddle: SKSpriteNode!
    var brick = SKSpriteNode()
    var label = UILabel()
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "Ball") as! SKSpriteNode
        paddle = self.childNode(withName: "Paddle") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 45, dy: 50))
        
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        self.physicsWorld.contactDelegate = self
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in: self)
            paddle.position.x = touchLocation.x
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in: self)
            paddle.position.x = touchLocation.x
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyAname = contact.bodyA.node?.name
        let bodyBname = contact.bodyB.node?.name
        
        
        if bodyAname == "Ball" && bodyBname == "Brick" || bodyAname == "Brick" && bodyBname == "Ball" {
            if bodyAname == "Brick" {
                contact.bodyA.node?.removeFromParent()
            } else if bodyBname == "Brick" {
                contact.bodyB.node?.removeFromParent()
            }
        }
        if bodyAname == "Ball" && bodyBname == "BrickTwo" || bodyAname == "BrickTwo" && bodyBname == "Ball" {
            if bodyAname == "BrickTwo" {
                contact.bodyA.node?.removeFromParent()
            }
            else if bodyBname == "BrickTwo" {
                contact.bodyB.node?.removeFromParent()
            }
        }
        if bodyAname == "Ball" && bodyBname == "BrickThree" || bodyAname == "BrickThree" && bodyBname == "Ball"{
            if bodyAname == "BrickThree" {
                contact.bodyA.node?.removeFromParent()
            }
            else if bodyBname == "BrickThree"{
                contact.bodyB.node?.removeFromParent()
            }
        }
        if bodyAname == "Ball" && bodyBname == "BrickFour" || bodyAname == "BrickFour" && bodyBname == "Ball" {
            if bodyAname == "BrickFour" {
                contact.bodyA.node?.removeFromParent()
            }
            else if bodyBname == "BrickFour"{
                contact.bodyB.node?.removeFromParent()
            }
        }
        if bodyAname == "Ball" && bodyBname == "loseZone" || bodyAname == "loseZone" && bodyBname == "Ball"{
            if bodyAname == "loseZone"{
                contact.bodyB.node?.removeFromParent()
            }
        }
    }
    
}

