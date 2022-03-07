//
//  ViewController.swift
//  Stock Average Down Calculator
//
//  Created by Mykel Agathos on 2022-02-17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentStockText: UITextField!
    @IBOutlet weak var averagePriceText: UITextField!
    @IBOutlet weak var currentValueText: UITextField!
    @IBOutlet weak var addedValueText: UITextField!
    @IBOutlet weak var newValueText: UITextField!
    @IBOutlet weak var newAverageText: UITextField!
    var currentStock: Int = 0
    var averagePrice: Float = 0.0
    var currentValue: Int = 0
    var stocksBuying: Int = 0
    var marketsPrice: Float = 0.0
    var addedValue: Int = 0
    var newValue: Int = 0
    var newAverage: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func currentStockTextChanged(_ sender: UITextField) {
        currentStock = Int(sender.text!) ?? 0
        currentValueText.text = "$" + String(getCurrentValue())
        newValueText.text = "$" + String(getNewValue())
        newAverageText.text = "$" +  String(round(getNewAverage() * 100) / 100)
    }
    
    @IBAction func averagePriceTextChanged(_ sender: UITextField) {
        averagePrice = Float(sender.text!) ?? 0.0
        currentValueText.text = "$" + String(getCurrentValue())
        newValueText.text = "$" + String(getNewValue())
        newAverageText.text = "$" +  String(round(getNewAverage() * 100) / 100)
    }
    
    @IBAction func stocksBuyingTextChanged(_ sender: UITextField) {
        stocksBuying = Int(sender.text!) ?? 0
        addedValueText.text = "$" + String(getAddedValue())
        newValueText.text = "$" + String(getNewValue())
        newAverageText.text = "$" +  String(round(getNewAverage() * 100) / 100)
    }
    
    @IBAction func marketsPriceTextChanged(_ sender: UITextField) {
        marketsPrice = Float(sender.text!) ?? 0.0
        addedValueText.text = "$" + String(getAddedValue())
        newValueText.text = "$" + String(getNewValue())
        newAverageText.text = "$" +  String(round(getNewAverage() * 100) / 100)
    }
    
    func getCurrentValue() -> Int {
        if (currentStock > 0 && averagePrice > 0) {
            currentValue = Int(Float(currentStock) * averagePrice)
            return currentValue
        } else {
            return 0
        }
    }
    
    func getAddedValue() -> Int {
        if (stocksBuying > 0 && marketsPrice > 0) {
            addedValue = Int(Float(stocksBuying) * marketsPrice)
            return addedValue
        } else {
            return 0
        }
    }
    
    func getNewValue() -> Int {
        if (currentValue > 0 && addedValue > 0) {
            newValue = currentValue + addedValue
            return newValue
        } else {
            return 0
        }
    }
    
    func getNewAverage() -> Float {
        if (currentValue > 0 && addedValue > 0) {
            newAverage = Float((currentValue + addedValue)) / Float((stocksBuying + currentStock))
            return newAverage
        } else {
            return 0
        }
    }
    
    @IBAction func resetApp(_ sender: UIButton) {
        currentStock = 0
        averagePrice = 0.0
        currentValue = 0
        stocksBuying = 0
        marketsPrice = 0.0
        addedValue = 0
        newValue = 0
        newAverage = 0.0
        currentStockText.text = ""
        averagePriceText.text = ""
        currentValueText.text = ""
        currentStockText.becomeFirstResponder()
    }
}
