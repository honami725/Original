//
//  ViewController.swift
//  Original
//
//  Created by Honami on 2016/02/17.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITabBarControllerDelegate {
    

    @IBOutlet var myNameLabel : UILabel!
    @IBOutlet var dateLabel :UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    
        //TabBar
        
        // fontの設定
        let fontFamily: UIFont! = UIFont.systemFontOfSize(10)
        // 選択時の設定
        let selectedColor:UIColor = UIColor(red: 123.0/255.0, green: 68.0/255.0, blue: 145.0/255.0, alpha: 1)
        let selectedAttributes = [NSFontAttributeName: fontFamily, NSForegroundColorAttributeName: selectedColor]
        /// タイトルテキストカラーの設定
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, forState: UIControlState.Selected)
        /// アイコンカラーの設定
        UITabBar.appearance().tintColor = selectedColor
        
        
        
        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        

        
        //自分の名前を表示
        myNameLabel.text = PFUser.currentUser()!.username! as String
        
        
        //残り何日表示
        let dateData = PFUser.currentUser()!.objectForKey("Date") as! String
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        //現在日時の取得
        let now = NSDate()
        let nowDate = dateFormatter.stringFromDate(now)
        //二つの日時の計算
        let startDate:NSDate? = dateFormatter.dateFromString(nowDate)
        let endDate:NSDate? = dateFormatter.dateFromString(dateData)
        let cal = NSCalendar.currentCalendar()
        let calUnit = NSCalendarUnit.Day
        let components = cal.components(calUnit, fromDate: startDate!, toDate: endDate!, options: NSCalendarOptions())
        //表示
        dateLabel.text = String(components.day)
        
        
        
    }
    
    //ステータスバーを白くする
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    

}

