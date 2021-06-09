//
//  ViewController.swift
//  UIKitSample
//
//  Created by Yusuf Turan on 9.06.2021.
//

import UIKit

class ViewController: UIViewController {


  @IBOutlet weak var num1: UITextField!
  @IBOutlet weak var num2: UITextField!
  @IBOutlet weak var result: UILabel!
  
  @IBAction func sum(_ sender: Any) {
    if let firstNum = Double(num1.text!) {
      if let secondNum = Double(num2.text!) {
        let result = firstNum + secondNum
        self.result.text = String(format: "Result: %3.2f", result)
      }
    }
  }
  @IBAction func substract(_ sender: Any) {
    if let firstNum = Double(num1.text!) {
      if let secondNum = Double(num2.text!) {
        let result = firstNum - secondNum
        self.result.text = String(format: "Result: %3.2f", result)
      }
    }
  }
  @IBAction func multiply(_ sender: Any) {
    if let firstNum = Double(num1.text!) {
      if let secondNum = Double(num2.text!) {
        let result = firstNum * secondNum
        self.result.text = String(format: "Result: %3.2f", result)
      }
    }
  }
  @IBAction func divideBy(_ sender: Any) {
    if let firstNum = Double(num1.text!) {
      if let secondNum = Double(num2.text!) {
        let result = firstNum / secondNum
        self.result.text = String(format: "Result: %3.2f", result)
      }
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

}

