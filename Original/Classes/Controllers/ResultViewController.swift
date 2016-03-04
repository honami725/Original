//
//  ResultViewController.swift
//  Original
//
//  Created by Honami on 2016/03/04.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit
import Parse

class ResultViewController: UIViewController {
    
    
    @IBOutlet var winnerLabel : UILabel!
    @IBOutlet var dateLabel : UILabel!
    var yourWeight : Double!
    var myWeight : Double!
    let saveData = NSUserDefaults.standardUserDefaults()
    private var yourWeightArray: [String?] = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.read()
        self.newWeightGet()
        myWeight = saveData.doubleForKey("newWeight")
        if myWeight > yourWeight{
            let yourName = saveData.objectForKey("YNAME")
            winnerLabel.text = yourName as? String
        }else if myWeight == yourWeight{
            winnerLabel.text = "引き分け！"
    }else{
            winnerLabel.text = PFUser.currentUser()!.username! as String

            
    }
    
        
        
        //期限の表示
        let date = saveData.objectForKey("DATE") as! String
        
        //開始日の表示
        let Date = PFUser.currentUser()!.objectForKey("createdDate") as! String

        //残り何日表示
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        
        //二つの日時の計算
        let startDate:NSDate? = dateFormatter.dateFromString(Date)
        let endDate:NSDate? = dateFormatter.dateFromString(date)
        let cal = NSCalendar.currentCalendar()
        let calUnit = NSCalendarUnit.Day
        let components = cal.components(calUnit, fromDate: startDate!, toDate: endDate!, options: NSCalendarOptions())
        //表示
        dateLabel.text = String(components.day)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func read(){
            let yourId = saveData.objectForKey("YID") as! String
            let query:PFQuery = PFUser.query()!
            query.whereKey("User", equalTo: yourId)
            query.orderByAscending("createdAt")
            query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
                if error == nil {
                    if let dataObjects: [PFObject] = objects! {
                        for dataObject in dataObjects {
                            self.yourWeightArray.append(dataObject["Weight"] as? String)
    
                        }
                    }else{
                        print("error1")
                    }
                }else{
                    print("error2")
                }
            }
    }
    
    func newWeightGet(){
        let part = yourWeightArray[0]
        print(part)
        let goalWeight = PFUser.currentUser()!.objectForKey("weight") as! String
        let doublePart = Double(part!)
        let doubleGoalWeight = Double(goalWeight)
        yourWeight = doublePart! - doubleGoalWeight!
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
