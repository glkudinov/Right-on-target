//
//  ViewController.swift
//  Right on target
//
//  Created by Gleb Kudinov on 25.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    
    @IBAction func checkNumber() {
        
        switch self.round {
        /*case 0:
         self.number = Int.random(in: 1...50)
         self.label.text = String(self.number)
         self.round = 1*/
        
        case 1...4:
            let numSlider = Int(slider.value.rounded())
            switch numSlider {
            
            case _ where numSlider > self.number:
                self.points += 50 - numSlider + self.number
                
            case _ where numSlider < self.number:
                self.points += 50 - self.number + numSlider
                
            case _ where numSlider == self.number:
                self.points += 50
                
            default:
                return
            }
            self.round += 1
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
            
        case 5:
            let alert = UIAlertController(
                title: "Игра окончена",
                message: "Вы заработали \(self.points) очков",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.label.text = "Последний результат \(self.points)"
            self.round = 0
            self.points = 0
        default:
            return
        }
        
    }
    override func loadView() {
        super.loadView()
        print("loadView")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisapper")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
}

