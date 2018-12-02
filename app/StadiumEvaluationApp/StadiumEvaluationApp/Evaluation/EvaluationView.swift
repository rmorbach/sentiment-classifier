//
//  EvaluationView.swift
//  StadiumEvaluationApp
//
//  Created by Rodrigo Morbach on 02/12/18.
//  Copyright © 2018 Morbach Inc. All rights reserved.
//

import UIKit

protocol EvaluationDelegate: class {
    func evaluate(sentence: String)
}

final class EvaluationView: UIView  {
    
    let evaluationTextView: UITextView = {
        let textView = UITextView(frame: CGRect.zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let evaluateButton: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.blue
        button.setTitle("Evaluate", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return button
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    weak var delegate: EvaluationDelegate?
    
    init(delegate: EvaluationDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }
    
    //Sempre necessário pois é usado por exemplo quando a View vem a partir do XIB ou Storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: IBAction
    
    @objc func evaluate() {
        self.delegate?.evaluate(sentence: self.evaluationTextView.text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
}
extension EvaluationView: CodeView {
    
    func setupConstraints() {
        
        // Button
        evaluateButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 0.0).isActive = true
        evaluateButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -40.0).isActive = true
        evaluateButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        evaluateButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        evaluateButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
        
        // TextView
        evaluationTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
        evaluationTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        evaluationTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
        evaluationTextView.bottomAnchor.constraint(equalTo: evaluateButton.topAnchor, constant: -20.0).isActive = true

        // Result label
        resultLabel.topAnchor.constraint(equalTo: evaluateButton.bottomAnchor, constant: 20.0).isActive = true
        resultLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
                
    }
    
    func setupComponents() {
        self.backgroundColor = UIColor.white
        addSubview(evaluateButton)
        addSubview(evaluationTextView)
        addSubview(resultLabel)
    }
    
    func setupExtras() {
        evaluateButton.addTarget(self, action: #selector(evaluate), for: UIControl.Event.touchUpInside)
    }
    
}
