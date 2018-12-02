//
//  ViewController.swift
//  StadiumEvaluationApp
//
//  Created by Rodrigo Morbach on 02/12/18.
//  Copyright © 2018 Morbach Inc. All rights reserved.
//

import UIKit
import NaturalLanguage


class ViewController: UIViewController {
    
    var sentimentPredictor: NLModel?
    
    override func loadView() {
        view = EvaluationView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        try? sentimentPredictor = NLModel(mlModel: Stadium().model)
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension ViewController: EvaluationDelegate {
    
    func evaluate(sentence: String) {
        guard let predictor = sentimentPredictor else { return }
        guard let predictResult = predictor.predictedLabel(for: sentence) else {
            debugPrint("Unable to evaluate")
            return
        }
        guard let v = view as? EvaluationView else { return }
        v.resultLabel.text = predictResult
    }
    
}

