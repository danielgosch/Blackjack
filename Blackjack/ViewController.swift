//
//  ViewController.swift
//  Blackjack
//
//  Created by Gosch, Daniel - PCA on 4/2/24.
//

import UIKit

class ViewController: UIViewController {

    var cards = ["102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "202", "203", "204", "205", "206", "207", "208", "209", "210", "211", "212", "213", "214", "302", "303", "304", "305", "306", "307", "308", "309", "310", "311", "312", "313", "314", "402", "403", "404", "405", "406", "407", "408", "409", "410", "411", "412", "413", "414"]
        
    var aces = [ "114", "214", "314", "414"]
    
    var faceCards = ["111", "112", "113", "211", "212", "213", "311", "312", "313", "411", "412", "413"]
    
    var numberCards = ["102", "103", "104", "105", "106", "107", "108", "109", "110", "202", "203", "204", "205", "206", "207", "208", "209", "210", "302", "303", "304", "305", "306", "307", "308", "309", "310", "402", "403", "404", "405", "406", "407", "408", "409", "410"]
    
    
    @IBOutlet weak var PC1: UIImageView!
    @IBOutlet weak var PC2: UIImageView!
    @IBOutlet weak var PC3: UIImageView!
    @IBOutlet weak var PC4: UIImageView!
    @IBOutlet weak var PC5: UIImageView!
    @IBOutlet weak var PC6: UIImageView!
    
    @IBOutlet weak var DC1: UIImageView!
    @IBOutlet weak var DC2: UIImageView!
    @IBOutlet weak var DC3: UIImageView!
    @IBOutlet weak var DC4: UIImageView!
    @IBOutlet weak var DC5: UIImageView!
    @IBOutlet weak var DC6: UIImageView!
    
    @IBOutlet weak var currentChipsLabel: UILabel!
    @IBOutlet weak var betTF: UITextField!
    
    var playerCard1 = ""
    var playerCard2 = ""
    var playerCard3 = ""
    var playerCard4 = ""
    var playerCard5 = ""
    var playerCard6 = ""
    
    var dealerCard1 = ""
    var dealerCard2 = ""
    var dealerCard3 = ""
    var dealerCard4 = ""
    var dealerCard5 = ""
    var dealerCard6 = ""
    
    var dealerPointsOne = 0
    var dealerPointsTwo = 0
    
    var playerScoreOptionOne = 0
    var playerScoreOptionTwo = 0
    
    var playerPointsOne = 0
    var playerPointsTwo = 0
    
    var hitCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.2078, green: 0.3961, blue: 0.302, alpha: 1)
    }

    @IBAction func dealButton(_ sender: Any) {
        playerCard1 = cards.randomElement()!
        //playerCard1 = "214"
        PC1.image = UIImage(named: playerCard1)
        cards = cards.filter({$0 != playerCard1})
        
        dealerCard1 = cards.randomElement()!
        DC1.image = UIImage(named: dealerCard1)
        cards = cards.filter({$0 != dealerCard1})
        
        playerCard2 = cards.randomElement()!
        //playerCard2 = "314"
        PC2.image = UIImage(named: playerCard2)
        cards = cards.filter({$0 != playerCard2})
        
        dealerCard2 = cards.randomElement()!
        DC2.image = UIImage(named: "000")
        cards = cards.filter({$0 != dealerCard2})
        
        var firstPlayerValue = 0
        var secondPlayerValue = 0
        
        
        
        func dealCheck (firstCard:String, secondCard:String){
            if aces.contains(firstCard) && aces.contains(secondCard){
                bothAceDealTotal (firstCard: firstCard, secondCard: secondCard)
            }
            else if aces.contains(firstCard){
                firstAceDealTotal (firstCard: firstCard, secondCard: secondCard)
            }
            else if aces.contains(secondCard){
                secondAceDealTotal (firstCard: firstCard, secondCard: secondCard)
            }
            else {
                noAceDealTotal(firstCard: firstCard, secondCard: secondCard)
            }
        }
        
        func bothAceDealTotal (firstCard:String, secondCard:String){
            playerScoreOptionOne = 2
            playerScoreOptionTwo = 12
            print("The score is either \(playerScoreOptionOne) or \(playerScoreOptionTwo)")
        }
        
        func firstAceDealTotal (firstCard:String, secondCard:String){
            if faceCards.contains(secondCard){
                secondPlayerValue = 10
            }
            else if numberCards.contains(secondCard){
                secondPlayerValue = Int(secondCard.suffix(2))!
            }
            playerScoreOptionOne = 1 + secondPlayerValue
            playerScoreOptionTwo = 11 + secondPlayerValue
            print("The score is either \(playerScoreOptionOne) or \(playerScoreOptionTwo)")
        }
        
        func secondAceDealTotal (firstCard:String, secondCard:String){
            if faceCards.contains(firstCard){
                firstPlayerValue = 10
            }
            else if numberCards.contains(firstCard){
                firstPlayerValue = Int(firstCard.suffix(2))!
            }
            playerScoreOptionOne = firstPlayerValue + 1
            playerScoreOptionTwo = firstPlayerValue + 11
            print("The score is either \(playerScoreOptionOne) or \(playerScoreOptionTwo)")
        }
            
        func noAceDealTotal (firstCard:String, secondCard:String){
            if faceCards.contains(firstCard){
                firstPlayerValue = 10
            }
            else if numberCards.contains(firstCard){
                firstPlayerValue = Int(firstCard.suffix(2))!
            }
            if faceCards.contains(secondCard){
                secondPlayerValue = 10
            }
            else if numberCards.contains(secondCard){
                secondPlayerValue = Int(secondCard.suffix(2))!
            }
            playerScoreOptionOne = firstPlayerValue + secondPlayerValue
            print(playerScoreOptionOne)
        }
        
        // Get total of dealer's first two cards
        print("this is the dealer's score")
        dealCheck(firstCard: dealerCard1, secondCard: dealerCard2)
        dealerPointsOne = playerScoreOptionOne
        dealerPointsTwo = playerScoreOptionTwo
        print("")
        
        // Get total of player's first two cards
        print("this is the player's score")
        dealCheck(firstCard: playerCard1, secondCard: playerCard2)
        playerPointsOne = playerScoreOptionOne
        playerPointsTwo = playerScoreOptionTwo

        
    }
    
    @IBAction func hitButton(_ sender: Any) {
        hitCount = hitCount + 1
        
        if hitCount == 1 {
            //playerCard3 = cards.randomElement()!
            playerCard3 = "114"
            PC3.image = UIImage(named: playerCard3)
            cards = cards.filter({$0 != playerCard3})
            if numberCards.contains(playerCard3){
                playerScoreOptionOne += Int(playerCard3.suffix(2))!
            }
            else if faceCards.contains(playerCard3){
                playerScoreOptionOne += 10
            }
            else if aces.contains(playerCard3){
                playerScoreOptionOne += 11
                if playerScoreOptionOne > 21 {
                    playerScoreOptionOne -= 10
                }
            }
            print(playerScoreOptionOne)
        }
        else if hitCount == 2 {
            playerCard4 = cards.randomElement()!
            PC4.image = UIImage(named: playerCard4)
            cards = cards.filter({$0 != playerCard4})
            if numberCards.contains(playerCard4){
                playerScoreOptionOne += Int(playerCard4.suffix(2))!
            }
            else if faceCards.contains(playerCard4){
                playerScoreOptionOne += 10
            }
            else if aces.contains(playerCard4){
                playerScoreOptionOne += 11
                if playerScoreOptionOne > 21 {
                    playerScoreOptionOne -= 10
                }
            }
            print(playerScoreOptionOne)
        }
        else if hitCount == 3 {
            playerCard5 = cards.randomElement()!
            PC5.image = UIImage(named: playerCard5)
            cards = cards.filter({$0 != playerCard5})
            if numberCards.contains(playerCard5){
                playerScoreOptionOne += Int(playerCard5.suffix(2))!
            }
            else if faceCards.contains(playerCard5){
                playerScoreOptionOne += 10
            }
            else if aces.contains(playerCard5){
                playerScoreOptionOne += 11
                if playerScoreOptionOne > 21 {
                    playerScoreOptionOne -= 10
                }
            }
            print(playerScoreOptionOne)
        }
        else if hitCount == 4 {
            playerCard6 = cards.randomElement()!
            PC6.image = UIImage(named: playerCard6)
            cards = cards.filter({$0 != playerCard6})
            if numberCards.contains(playerCard6){
                playerScoreOptionOne += Int(playerCard6.suffix(2))!
            }
            else if faceCards.contains(playerCard6){
                playerScoreOptionOne += 10
            }
            else if aces.contains(playerCard6){
                playerScoreOptionOne += 11
                if playerScoreOptionOne > 21 {
                    playerScoreOptionOne -= 10
                }
            }
            print(playerScoreOptionOne)
        }
        
        
    }
    
    @IBAction func stayButton(_ sender: Any) {
    }
    
    @IBAction func splitButton(_ sender: Any) {
    }
    
}

