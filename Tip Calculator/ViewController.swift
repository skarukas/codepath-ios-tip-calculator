//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Stephen Karukas on 8/24/19.
//  Copyright © 2019 Stephen Karukas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var customTipField: UITextField!
    @IBOutlet weak var customTipView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func updateBill(_ sender: Any) {
        // get bill amount
        let bill = Double(billField.text!) ?? 0
        let customTip = Int(customTipField.text!) ?? 0
        
        // calc bill and total
        let tipPercentages = [15, 18, 22, customTip]
        let selectedIndex = tipControl.selectedSegmentIndex
        customTipView.isHidden = selectedIndex != 3
        let tipPercent = tipPercentages[selectedIndex]
        let tip = bill * Double(tipPercent) / 100.0
        let total = tip + bill
        
        // format currency
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.locale = Locale.current
        print(Locale.current.identifier)
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        let totalString = currencyFormatter.string(for: total)
        let tipString = currencyFormatter.string(for: tip)
        
        // update bill and total
        tipLabel.text = tipString
        totalLabel.text = totalString
        customTipField.text = String(tipPercent)
    }
}

