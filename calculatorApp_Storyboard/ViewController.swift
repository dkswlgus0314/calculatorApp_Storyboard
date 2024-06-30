//
//  ViewController.swift
//  calculatorApp_Storyboard
//
//  Created by ahnzihyeon on 6/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    //현재 화면에 표시되는 값
    var viewNum = "0" {
        didSet {
            numLabel.text = viewNum
        }
    }
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet var buttonList: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numLabel.text = "0"
    }
    
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        let userInput = sender.currentTitle!
        
        switch userInput {
        case "AC":
            viewNum = "0"
        case "=":
            let result = calculate(expression: viewNum.replacingOccurrences(of: "×", with:  "*").replacingOccurrences(of: "÷", with: "/"))
            viewNum = String(result ?? 0) //Nil-Coalescing Operation
        default:
            if numLabel.text == "0" { viewNum.removeFirst() }
            viewNum += userInput
        }
    }
    
    /// 수식 문자열을 넣으면 계산해주는 메서드.
    ///
    /// 예를 들어 expression 에 "1+2+3" 이 들어오면 6 을 리턴한다.
    /// 잘못된 형식의 수식을 넣으면 앱이 크래시 난다. ex) "1+2++"
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    
}


