//
//  ViewController.swift
//  Clicking Fighter
//
//  Created by UCode on 4/7/18.
//  Copyright © 2018 UCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var enemyHealth: Float = 100
    var maxHealth: Float = 100
    var coins: Int = 0
    @IBOutlet var enemyHealthLabel: UILabel!
    @IBOutlet var healthBar: UIProgressView!
    @IBOutlet var coinCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        enemyHealthLabel.text = "Enemy Health: \(enemyHealth)"
        enemyHealthLabel.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func attackEnemy(){
        enemyHealth -= 10
        if(enemyHealth <= 0){
            enemyHealth = maxHealth + 50
            maxHealth = enemyHealth
            getReward()
        }
        enemyHealthLabel.text = "Enemy Health: \(enemyHealth)"
        enemyHealthLabel.sizeToFit()
        healthBar.progress = enemyHealth/maxHealth
    }

    func getReward(){
        var rewardCoins = Int(round(maxHealth/2))
        coins += rewardCoins
        coinCount.text = "Coins: \(rewardCoins)"
        coinCount.sizeToFit()
     }
}

