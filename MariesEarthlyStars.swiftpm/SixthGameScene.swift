//
//  SixthGameScene.swift
//  MariesEarthlyStars
//
//  Created by Bianca Nathally Bezerra de Lima on 18/04/23.
//

import SpriteKit

class SixthGameScene: SKScene {
    
    var petriPrecipitados, menuButton: SKSpriteNode!
    var martelo, mangueira, pote, dropper, retangulo, journal, iconJournal: SKSpriteNode?
    
    var isJournalOpen: Bool = false
    var touchPlayer: Bool = false
    var touchPlayer2: Bool = false
    var touchPlayer3: Bool = false
    var touchPlayer4: Bool = false
    
    let petriPrecipitadosSize = CGSize(width: 380, height: 380)
    let marteloSize = CGSize(width: 200, height: 200)
    let mangueiraSize = CGSize(width: 200, height: 200)
    let poteSize = CGSize(width: 200, height: 200)
    let dropperSize = CGSize(width: 200, height: 200)
    let closeSize = CGSize(width: 33.05, height: 33.02)
    let retanguloSize = CGSize(width: 1197, height: 211)
    let journalSize = CGSize(width: 250, height: 250)
    let iconJournalSize = CGSize(width: 298, height: 357)
    
    override func didMove(to view: SKView) {
        
        let menuButtonWidth: CGFloat = 57.23
        let menuButtonHeight: CGFloat = 50.09
        let safeArea = view.safeAreaLayoutGuide
        
        menuButton = SKSpriteNode(imageNamed: "menu")
        menuButton.name = "menuButton"
        menuButton.position = CGPoint(x: safeArea.layoutFrame.maxX - 50 - menuButton.size.width / 2,
                                      y: safeArea.layoutFrame.maxY - 50 - menuButton.size.height / 2)
        menuButton.zPosition = 1
        menuButton.aspectFillToSize(self.size)
        menuButton.size = CGSize(width: menuButtonWidth, height: menuButtonHeight)
        
        addChild(menuButton)
        
        let background = SKSpriteNode(imageNamed: "game-screen-6")
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.zPosition = -1
        background.size = self.frame.size
        background.aspectFillToSize(self.size)
        self.addChild(background)
        
        positionThings()
    }
    
    func positionThings() {
        
        journal = SKSpriteNode(imageNamed: "journal")
        journal?.size = journalSize
        journal?.position = CGPoint(x: self.frame.midX+560, y: self.frame.midY-50)
        journal?.name = "journalButton"
        addChild(journal!)
        
        if let journal = journal {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + journal.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - journal.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + journal.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - journal.size.height / 2))
            journal.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        iconJournal = SKSpriteNode(imageNamed: "icon-journal")
        iconJournal?.size = iconJournalSize
        iconJournal?.position = CGPoint(x: self.frame.midX+560, y: self.frame.midY-50)
        iconJournal?.zPosition = -1
        iconJournal?.alpha = 0
        let fadeIn = SKAction.fadeIn(withDuration: 2.0)
        iconJournal?.run(fadeIn)
        addChild(iconJournal!)
        
        if let iconJournal = iconJournal {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + iconJournal.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - iconJournal.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + iconJournal.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - iconJournal.size.height / 2))
            iconJournal.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        petriPrecipitados = SKSpriteNode(imageNamed: "petri-precipitados")
        petriPrecipitados?.size = petriPrecipitadosSize
        petriPrecipitados.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(petriPrecipitados)
        
        martelo = SKSpriteNode(imageNamed: "martelo")
        martelo?.name = "martelo"
        martelo?.size = marteloSize
        martelo?.position = CGPoint(x: self.frame.midX-550, y: self.frame.midY-380)
        addChild(martelo!)
        
        if let martelo = martelo {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + martelo.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - martelo.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + martelo.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - martelo.size.height / 2))
            martelo.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        mangueira = SKSpriteNode(imageNamed: "petri")
        mangueira?.name = "petri"
        mangueira?.size = mangueiraSize
        mangueira?.position = CGPoint(x: self.frame.midX-310, y: self.frame.midY-380)
        addChild(mangueira!)
        
        if let mangueira = mangueira {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + mangueira.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - mangueira.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + mangueira.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - mangueira.size.height / 2))
            mangueira.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        pote = SKSpriteNode(imageNamed: "pote")
        pote?.name = "pote"
        pote?.size = poteSize
        pote?.position = CGPoint(x: self.frame.midX-100, y: self.frame.midY-380)
        addChild(pote!)
        
        if let pote = pote {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + pote.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - pote.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + pote.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - pote.size.height / 2))
            pote.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        dropper = SKSpriteNode(imageNamed: "dropper")
        dropper?.name = "dropper"
        dropper?.size = dropperSize
        dropper?.position = CGPoint(x: self.frame.midX+60, y: self.frame.midY-380)
        addChild(dropper!)
        
        if let dropper = dropper {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + dropper.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - dropper.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + dropper.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - dropper.size.height / 2))
            dropper.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
        
        retangulo = SKSpriteNode(imageNamed: "retangulo")
        retangulo?.size = retanguloSize
        retangulo?.position = CGPoint(x: 550, y: 105)
        retangulo?.zPosition = -1
        addChild(retangulo!)
        
        if let retangulo = retangulo {
            let leftConstraint = SKConstraint.positionX(SKRange(lowerLimit: self.frame.minX + retangulo.size.width / 2))
            let rightConstraint = SKConstraint.positionX(SKRange(upperLimit: self.frame.maxX - retangulo.size.width / 2))
            let bottomConstraint = SKConstraint.positionY(SKRange(lowerLimit: self.frame.minY + retangulo.size.height / 2))
            let topConstraint = SKConstraint.positionY(SKRange(upperLimit: self.frame.maxY - retangulo.size.height / 2))
            retangulo.constraints = [leftConstraint, rightConstraint, bottomConstraint, topConstraint]
        }
    }
    
    func isPlayer(location: CGPoint) -> Bool {
        if location.x <= martelo!.position.x+100 && location.x >= martelo!.position.x-100 && location.y <= martelo!.position.y+100 && location.y >= martelo!.position.y-100 {
            return true
        } else {
            return false
        }
    }
    
    func isPlayer2(location: CGPoint) -> Bool {
        if location.x <= mangueira!.position.x+100 && location.x >= mangueira!.position.x-100 && location.y <= mangueira!.position.y+100 && location.y >= mangueira!.position.y-100 {
            return true
        } else {
            return false
        }
    }
    
    func isPlayer3(location: CGPoint) -> Bool {
        if location.x <= pote!.position.x+100 && location.x >= pote!.position.x-100 && location.y <= pote!.position.y+100 && location.y >= pote!.position.y-100 {
            return true
        } else {
            return false
        }
    }
    
    func isPlayer4(location: CGPoint) -> Bool {
        if location.x <= dropper!.position.x+100 && location.x >= dropper!.position.x-100 && location.y <= dropper!.position.y+100 && location.y >= dropper!.position.y-100 {
            return true
        } else {
            return false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "martelo" {
                touchPlayer = true
            } else if touchedNode.name == "petri" {
                touchPlayer2 = true
            } else if touchedNode.name == "pote" {
                touchPlayer3 = true
            } else if touchedNode.name == "dropper" {
                touchPlayer4 = true
            }
            
            if touchedNode.name == "menuButton" {
                goMenu()
            }
            
            if (touchedNode.name == "journalButton" && !isJournalOpen) {
                
                isJournalOpen = true
                
                // Display popup screen
                let popup = SKSpriteNode(imageNamed: "journal-6")
                popup.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
                popup.zPosition = 1
                popup.setScale(0)
                popup.size = CGSize(width: self.size.width * 0.9, height: self.size.height * 0.9)
                
                // Add close button to popup
                let closeButton = SKSpriteNode(imageNamed: "close")
                //closeButton.position = CGPoint(x: 460, y: 300)
                closeButton.position = CGPoint(x: UIScreen.main.bounds.width * 0.4, y: UIScreen.main.bounds.width * 0.28)
                closeButton.size = closeSize
                closeButton.name = "closeButton"
                popup.addChild(closeButton)
                
                addChild(popup)
                
                let scaleAction = SKAction.scale(to: 1.0, duration: 0.2)
                popup.run(scaleAction)
                
            } else if touchedNode.name == "closeButton" {
                
                // Remove popup screen
                if let popup = touchedNode.parent {
                    popup.removeFromParent()
                    
                    isJournalOpen = false
                }
            }
        }
        
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
    }
    
    func goMenu() {
        guard let view = view else { return }
        let gameScene = MenuScene(size: view.bounds.size)
        gameScene.scaleMode = .aspectFill
        let transition = SKTransition.fade(withDuration: 0.2)
        self.view?.presentScene(gameScene, transition: transition)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        if touchPlayer {
            martelo!.position = location
        }
        
        if touchPlayer2 {
            mangueira!.position = location
        }
        
        if touchPlayer3 {
            pote!.position = location
        }
        
        if touchPlayer4 {
            dropper!.position = location
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        touchPlayer = false
        martelo?.position = CGPoint(x: self.frame.midX-550, y: self.frame.midY-380)
        
        touchPlayer2 = false
        mangueira?.position = CGPoint(x: self.frame.midX-310, y: self.frame.midY-380)
        
        touchPlayer3 = false
        pote?.position = CGPoint(x: self.frame.midX-100, y: self.frame.midY-380)
        
        touchPlayer4 = false
        dropper?.position = CGPoint(x: self.frame.midX+60, y: self.frame.midY-380)
        
        if petriPrecipitados!.color == .red {
            let sixthScene = SeventhGameScene(size: self.size)
            sixthScene.scaleMode = self.scaleMode
            let transition = SKTransition.fade(withDuration: 0.2)
            self.view?.presentScene(sixthScene, transition: transition)
            dropper?.position = CGPoint(x: self.frame.midX-200, y: self.frame.midY-200)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if petriPrecipitados!.position.x+80 <= dropper!.position.x+200 && petriPrecipitados!.position.x-80 >= dropper!.position.x-200 && petriPrecipitados!.position.y+80 <= dropper!.position.y+200 && petriPrecipitados!.position.y-80 >= dropper!.position.y-200 {
            
            petriPrecipitados!.color = UIColor.red
        }
    }
}
