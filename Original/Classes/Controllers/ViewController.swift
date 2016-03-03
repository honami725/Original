//
//  ViewController.swift
//  Original
//
//  Created by Honami on 2016/02/17.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITabBarControllerDelegate, UITextFieldDelegate {
    
    let saveData = NSUserDefaults.standardUserDefaults()
    @IBOutlet var myNameLabel : UILabel!
    @IBOutlet var myDateLabel : UILabel!
    @IBOutlet var myWeightLabel : UILabel!
    @IBOutlet var yourNameLabel : UILabel!
    @IBOutlet var yourWeightLabel : UILabel!
    @IBOutlet var error1 : UILabel!
    @IBOutlet var error2 : UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
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
        myDateLabel.text = String(components.day)
        
        
        //あと何kg表示
        let weight : Double = saveData.doubleForKey("WEIGHT")
        let weight2 : Double = saveData.doubleForKey("WEIGHT2")
        let myWeight : Double = weight - weight2
        myWeightLabel.text = "\(myWeight)"
        
        
        //let myWeight = PFUser.currentUser()!.objectForKey("WEIGHT") as! Double
        //myWeightLabel.text = "\(myWeight)"
        
        
        let yourName = saveData.objectForKey("YNAME")
        if yourName == nil {
            yourNameLabel.text = "名無し"
            error1.text = "対戦相手がいないよ！"
            error2.text = "『設定』から登録してね！"
        }else{
            yourNameLabel.text = yourName as? String
            error1.text = ""
            error2.text = ""
        }
        
        
        let yourWeight = saveData.objectForKey("YWEIGHT")
        if yourWeight == nil {
            yourWeightLabel.text = "---"
        }else{
            yourWeightLabel.text = yourWeight as? String
        }

        
    }

    
    
    // enter押すとキーボードをさげる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    

}

