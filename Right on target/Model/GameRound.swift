//
//  GameRound.swift
//  Right on target
//
//  Created by Gleb Kudinov on 02.02.2022.
//

import Foundation
protocol GameRoundProtocol {
    var score: Int { get }
    var currentSecretValue: Int! { get }
    
    func calulateScore(with value: Int)
}

class GameRound: GameRoundProtocol {
    
    var score: Int = 0
    
    var currentSecretValue: Int! = 0
    
    init(secretValue: Int) {
        currentSecretValue = secretValue
    }
    
    func calulateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
