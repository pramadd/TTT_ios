//
//  ViewController.swift
//  TTT
//
//  Created by Rohan Baddam on 11/1/17.
//  Copyright © 2017 Rohan Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
   
    @IBOutlet weak var infoLabel: UILabel!
    var buttons: [UIButton]!

    var game = [
        [1,1,1],
        [1,1,1],
        [1,1,1]
    ]

    var player = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [
            button0,button1,button2,
            button3,button4,button5,
            button6,button7,button8
        ]
        infoLabel.text = "Start a game"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }

    @IBAction func newGameButtonPressed(_ sender: UIButton){
        game = [
            [0,0,0],
            [0,0,0],
            [0,0,0]
        ]
        for button in buttons {
            button.backgroundColor = .lightGray
        }
        player = 1
        infoLabel.text = "Blues Turn"
        
    }

    func checkWinner(){
        var winner = 0
        var sum = 0
        // cols
        for col in game {
            sum = col.reduce(0, +)
            if sum == 3 { winner = 1}
            else if sum == -3 { winner = -1 }
    }

    //rows
        for x in 0...2{
            let a = game[0][x]
            let b = game[1][x]
            let c = game[2][x]
            sum  =  a+b+c
            if sum == 3 { winner = 1}
            else if sum == -3 { winner = -1 }
        }

        sum = game[0][0] + game[1][1] + game[2][2]
        if sum == 3 { winner = 1}
        else if sum == -3 { winner = -1}

        sum = game[2][0] + game[1][1] + game[0][2]
        if sum == 3 { winner = 1}
        else if sum == -3 { winner = -1}


        DispatchQueue.main.async {
            if winner == 1{
                print ("Blue win")
                self.infoLabel.text = "Blue wins!"
            } else if winner == -1 {
                print ("Red win")
                self.infoLabel.text = "Red Wins!"
            }
    }
        if winner != 0 {
            game = [
                [1,1,1],
                [1,1,1],
                [1,1,1]
            ]
        }
}

    @IBAction func buttonPressed(_ sender: UIButton){
        var tagstr = string(format: "%02d", sender.tag)
        let x = INT(string(Array(tagstr.characters)[0]))!
        let y = INT(string(Array(tagstr.characters)[1]))!
        
        if game[x][y] == 0{
            game[x][y] = player
            var color: UIColor
            if player == 1 { color = .blue}
            else { color = .red}
            
            sender.backgroundColor = color
            
            checkWinner()
            
            if player == 1 {
                player = -1
                infoLabel.text = " Reds Turn"
            }
            else {
                player = 1
                infoLabel.text = " Blue Turn"
            }
        }
    }
}
