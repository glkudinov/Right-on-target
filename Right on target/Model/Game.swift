//
//  File.swift
//  Right on target
//
//  Created by Gleb Kudinov on 01.02.2022.
//

import Foundation
protocol GameProtocol {
    var score: Int  { get }
    var secretValueGenerator: GeneratorProtocol { get }
    var currentRound: GameRoundProtocol! {get}
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
}

class Game: GameProtocol {
    
    var score: Int {
       
        var totalScore: Int = 0
        
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    
    var secretValueGenerator: GeneratorProtocol
    
    var currentRound: GameRoundProtocol!
    
    private var roundCounts: Int!
    
    private var rounds: [GameRoundProtocol] = []
    
    var isGameEnded: Bool {
        if roundCounts == rounds.count {
            return true
        } else {
            return false
        }
    }
    
    
    
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
        roundCounts = rounds
        startNewRound()
    }
    
    
    func restartGame() {
        rounds = []
        startNewRound()    }
    
    func startNewRound() {
        let newSecretValue = getNewSecretValue()
        currentRound = GameRound(secretValue: newSecretValue)
        rounds.append(currentRound)
        
    }
    
    private func getNewSecretValue() -> Int {
        return secretValueGenerator.getRandomValue()
    }
}


