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
        game = Game(startValue: 0, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }

    //MARK: - Взаимодействие View - Model
    @IBAction func checkNumber() {
        game.calculateScore(with: Int(slider.value))
        if !(game.isGameEnded) {
            game.startNewRound()
        } else {
            showAlertWith(score: game.score)
            game.restart()
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
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

