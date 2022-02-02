//
//  ViewController.swift
//  Right on target
//
//  Created by Gleb Kudinov on 25.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    //MARK: - Жизненный цикл
    override func viewDidLoad() {
        super.viewDidLoad()
        let generator = Generator(startValue: 1, endValue: 50)!
        game = Game(valueGenerator: generator, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }

    //MARK: - Взаимодействие View - Model
    @IBAction func checkNumber() {
        game.currentRound.calulateScore(with: Int(slider.value))
        if !(game.isGameEnded) {
            game.startNewRound()
        } else {
            showAlertWith(score: game.score)
            game.restartGame()
        }
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }

    //MARK: - Обновление View
       
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
                                        title: "Игра окончена",
                                        message: "Вы заработали \(score) очков",
                                        preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново?", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

