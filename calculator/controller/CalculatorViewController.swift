//
//  CalculatorViewController.swift
//  calculator
//
//  Created by binyu on 2021/5/13.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
   
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath: Bool = false
    var opertion: OperationType = .none
    var startNew = true
    var errorNumber: Bool = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        numberLabel.text = "0"
        numberOnScreen = 0
        previousNumber = 0
        performingMath = false
        opertion = .none
        startNew = true
        errorNumber = false
    }
    @IBAction func numbers(_ sender: UIButton) {
        let inputNumber = sender.tag - 1
        if numberLabel.text != nil {
            if startNew == true {
                numberLabel.text = inputNumber.description
                startNew = false
            }else{
            if numberLabel.text == "0" || numberLabel.text == "+" || numberLabel.text == "-" || numberLabel.text == "X" || numberLabel.text == "/" {
                if numberLabel.text == "/" && inputNumber == 0 {
                   errorNumber = true
                    numberLabel.text = inputNumber.description
                }else{
                numberLabel.text = inputNumber.description
                }
            }else{
                numberLabel.text = numberLabel.text! + inputNumber.description
            }
          }
        }
        numberOnScreen = Double(numberLabel.text!) ?? 0
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        numberLabel.text = "+"
        opertion = .add
        performingMath = true
       
        previousNumber = numberOnScreen
        
    }
    
    @IBAction func subtractButton(_ sender: UIButton) {
        numberLabel.text = "-"
        opertion = .subtract
        performingMath = true
        
        previousNumber = numberOnScreen
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        numberLabel.text = "X"
        opertion = .multiply
        performingMath = true
       
        previousNumber = numberOnScreen
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        numberLabel.text = "/"
        opertion = .divide
        performingMath = true
        
        previousNumber = numberOnScreen
    }
    
    @IBAction func anserButton(_ sender: UIButton) {
        if errorNumber == false {
        if performingMath{
            switch opertion {
            case .subtract:
               numberOnScreen = previousNumber - numberOnScreen
                makeOKNumberString(from: numberOnScreen)
                
            case .add:
                numberOnScreen = previousNumber + numberOnScreen
                 makeOKNumberString(from: numberOnScreen)
            case .multiply:
                numberOnScreen = previousNumber * numberOnScreen
                 makeOKNumberString(from: numberOnScreen)
            case .divide:
                numberOnScreen = previousNumber / numberOnScreen
                 makeOKNumberString(from: numberOnScreen)
            case .none:
                numberLabel.text = "0"
            }
            performingMath = false
            startNew = true
        }
        }else{
            numberLabel.text = "錯誤"
        }
    }
    
    func makeOKNumberString(from number:Double) {
        var okText: String
        if floor(number) == number{
            okText = "\(Int(number))"
        }else{
          okText = "\(number)"
        }
        if okText.count >= 10 {
            okText = String(okText.prefix(10))
        }
        numberLabel.text = okText
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
