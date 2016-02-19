//
//  ViewController.swift
//  Original
//
//  Created by Honami on 2016/02/17.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var dateLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //現在時刻を取得.
        let myDate: NSDate = NSDate()
        
        //カレンダーを取得.
        let myCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        
        //取得するコンポーネントを決める.
        

        let myComponetns = myCalendar.components([NSCalendarUnit.Year,
            NSCalendarUnit.Month,
            NSCalendarUnit.Day,
            NSCalendarUnit.Hour,
            NSCalendarUnit.Minute,
            NSCalendarUnit.Second,
            NSCalendarUnit.Weekday],
            fromDate: myDate)
        
        let weekdayStrings: Array = ["nil","日","月","火","水","木","金","土","日"]
        
        print("year: \(myComponetns.year)")
        print("month: \(myComponetns.month)")
        print("day: \(myComponetns.day)")
        print("hour: \(myComponetns.hour)")
        print("minute: \(myComponetns.minute)")
        print("second: \(myComponetns.second)")
        print("weekday: \(weekdayStrings[myComponetns.weekday])")
        
        //現在時間表示用のラベルを生成.
        var myStr: String =
//        "\(myComponetns.year)年"
//        myStr +=
        "\(myComponetns.month)月"
        myStr += "\(myComponetns.day)日（"
        myStr += "\(weekdayStrings[myComponetns.weekday])）"
//        myStr += "\(myComponetns.hour)時
//        myStr += "\(myComponetns.minute)分"
//        myStr += "\(myComponetns.second)秒"
        
        dateLabel.text = myStr
        dateLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(dateLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

