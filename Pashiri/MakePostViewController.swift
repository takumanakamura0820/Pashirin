//
//  MakePostViewController.swift
//  Pashiri
//
//  Created by TAKUMA NAKAMURA on 2019/08/19.
//  Copyright © 2019 NakamuraTakuma. All rights reserved.
//

import UIKit

class MakePostViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate{
    
    @IBOutlet var titleTextfield: UITextField!
    
    @IBOutlet var pashiriDetailTextview: UITextView!
    
    @IBOutlet var coinPickerView: UIPickerView!
    
    @IBOutlet var timePickerView: UIPickerView!
    
    var coinList:[String] = ["100","200","300","400","500","600","700","800","900","1000"]
    
    var monthList :[String] = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    
    var dayList = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    
    var hourList = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"]
    
    var minuteList = ["00","15","30","45"]
    
    var selectedCoin: String = "100"
    var selectedMonth: String = "1"
    var selectedDay: String = "1"
    var selectedHour: String = "1"
    var selectedMinute: String = "00"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinPickerView.dataSource = self
        
        coinPickerView.delegate = self
        
        timePickerView.dataSource = self
        
        timePickerView.delegate = self
        
        pashiriDetailTextview.delegate = self 
        
        timePickerView.tag = 2
        
        coinPickerView.tag = 3
        
        timePickerView.selectRow(0, inComponent: 0, animated: false)
        timePickerView.selectRow(1, inComponent: 1, animated: false)
        timePickerView.selectRow(2, inComponent: 2, animated: false)
        timePickerView.selectRow(3, inComponent: 3, animated: false)
    }
}


extension MakePostViewController:UIPickerViewDataSource, UIPickerViewDelegate {
    //ドラムロール数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 2{
            return 4
        }else{
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 2{
            switch component {
            case 0:
                return monthList.count
            case 1:
                return dayList.count
            case 2:
                return hourList.count
            case 3:
                return minuteList.count
            default:
                return 0
            }
        }else{
            return coinList.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 2{
            switch component {
            case 0:
                return monthList[row]
            case 1:
                return dayList[row]
            case 2:
                return hourList[row]
            case 3:
                return minuteList[row]
            default:
                return "error"
            }
        }else{
             return coinList[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 2{
        switch component {
        case 0:
            selectedMonth = monthList[row]
        case 1:
            selectedDay = dayList[row]
        case 2:
            selectedHour = hourList[row]
        case 3:
            selectedMinute = minuteList[row]
        default: return
        }
        }else{
            selectedCoin = coinList[row]
        }
    }
    
    @IBAction func didPushBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func byInstantiateViewController(_ sender:UIButton) {
//        performSegue(withIdentifier: "toConfirm", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConfirm" {
            let vc = segue.destination as! ConfirmViewController
            vc.titleName = titleTextfield.text
            vc.time = selectedMonth + "月" + selectedDay + "日" + selectedHour + "時" + selectedMinute + "分"
            vc.detail = pashiriDetailTextview.text
            vc.coin = selectedCoin
        }
    }
    
}
