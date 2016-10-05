//
//  ViewController.swift
//  Calculator
//
//  Created by shaowei on 2016/9/23.
//  Copyright © 2016年 shaowei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!

    private var isInTheMiddleOfTexting = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if isInTheMiddleOfTexting{
            let textCurrentlyInTheLable = display.text!
            display.text = textCurrentlyInTheLable + digit
        } else {
            display.text = digit
        }
        isInTheMiddleOfTexting = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    var saveProgram: CalculatorBrain.PropertyList?
    
    @IBAction func save() {
        saveProgram = brain.program
    }
    
    @IBAction func restore() {
        if saveProgram != nil {
            brain.program = saveProgram!
            displayValue = brain.result
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if isInTheMiddleOfTexting{
            brain.setOperand(operand: displayValue)
            isInTheMiddleOfTexting = false
        }
        if let mathSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathSymbol)
        }
        displayValue = brain.result
    }
}

