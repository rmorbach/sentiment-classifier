//
//  ViewCode.swift
//  StadiumEvaluationApp
//
//  Created by Rodrigo Morbach on 02/12/18.
//  Copyright © 2018 Morbach Inc. All rights reserved.
//

import Foundation

protocol CodeView {
    
    func setupComponents()
    func setupConstraints()
    func setupExtras()
    func setup()
    
}

extension CodeView {
    func setup() {
        setupComponents()
        setupConstraints()
        setupExtras()
    }
}
