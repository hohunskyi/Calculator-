//
//  ViewController.swift
//  Calculator
//
//  Created by Vladimir Gogunsky on 3/19/22.
//

import UIKit

class ViewController: UIViewController {
    var nfs:Double = 0 // numberFromScrean
    var fN:Double = 0 //FirstNumber
    var operation:Int = 0
    var mathSign = false
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }
        else {
            result.text = result.text! + String(sender.tag)
        }
        
        nfs = Double(result.text!)!
     }
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 16 && sender.tag != 10{
            fN = Double(result.text!)!
            
            if sender.tag == 12 {//delenie
                result.text = "/"
            }
        
            else if sender.tag == 13 {//x
                result.text = "x"
            }
            else if sender.tag == 14 {//-
                result.text = "-"
            }
            else if sender.tag == 15 {//+
                result.text = "+"
            }
            
            operation = sender.tag
            mathSign = true;
        }
        else if sender.tag == 16 {//=
            if operation == 12 {
                result.text = String(fN / nfs)
            }
            else if operation == 13 {
                result.text = String(fN * nfs)
            }
            else if operation == 14 {
                result.text = String(fN - nfs)
            }
            else if operation == 15 {
                result.text = String(fN + nfs)
            }
            
        }
        else if sender.tag == 10 {
            result.text = ""
            fN =  0
            nfs =  0
            operation = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

