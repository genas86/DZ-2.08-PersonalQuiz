//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension ResultViewController {
    private func updateResult() {
        var frequencyAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
       for animal in animals {
            if let animalTypeCount = frequencyAnimals[animal] {
                frequencyAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyAnimals[animal] = 1
            }
        }
    
 
     /*
        for animal in animals {
            frequencyAnimals[animal] = (frequencyAnimals[animal] ?? 0) + 1
        }
      */
        
     //
//        for animal in animals {
//            frequencyAnimals[animal, default: 0] += 1
//        }

      let sortedFrequencyOfAnimals = frequencyAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyOfAnimals = sortedFrequencyOfAnimals.first?.key else { return }
        
        // Решение в одну строку:
//        let mostFrequencyOfAnimals = Dictionary(grouping: answers) { $0.animal } .sorted { $0.value.count > $1.value.count } .first?.key
//
        updateUI(with: mostFrequencyOfAnimals)
    }
    
    private func updateUI(with animal: Animal) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
    
//    // решение в одну строку:
//    private func updateUI(with animal: Animal?) {
//        animalTypeLabel.text = "Вы - \(animal?.rawValue ?? "💩")!"
//        descriptionLabel.text = animal?.definition ?? ""
//    }
//}
}
