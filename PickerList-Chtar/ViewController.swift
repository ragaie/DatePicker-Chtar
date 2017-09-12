//
//  ViewController.swift
//  PickerList-Chtar
//
//  Created by Ragaie alfy on 7/19/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DatePickerDelegate {

    @IBOutlet weak var selectGender: UIButton!
    
    
    @IBOutlet weak var datePickerShow: DatePicker!
    
    var showPicker : DatePicker!
   
    var item = ["male","female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       datePickerShow.delegate = self
        
   
        
        
       // pickerMenu.dataSourceItem = item
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func showPicker(_ sender: Any) {
        
        datePickerShow.show()
    }
    
    
    
    func DatePicker(_ datepicker: DatePicker, didSelectDate date: Date) {
        
        
        
        print(date.description)
    }

    
}

