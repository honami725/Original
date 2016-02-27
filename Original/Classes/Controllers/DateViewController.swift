//
//  DateViewController.swift
//  Original
//
//  Created by Honami on 2016/02/26.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    
    let saveData = NSUserDefaults.standardUserDefaults()
    @IBOutlet var label : UILabel!
    @IBOutlet var error : UILabel!
    @IBOutlet var datePicker : UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        datePicker.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func datePickerValueChanged (datePicker: UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        
        let dateValue = dateFormatter.stringFromDate(datePicker.date)
        
        label.text = dateValue
        
    }

    @IBAction func input(){
        if label.text == ""{
            error.text = "正しい日付を選んでください!"
        }else{
            saveData.setObject(label.text, forKey: "DATE")
            performSegueWithIdentifier("Push", sender: nil)
            
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


