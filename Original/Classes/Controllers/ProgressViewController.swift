//
//  ProgressViewController.swift
//  Original
//
//  Created by Honami on 2016/02/24.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit
import Parse

class ProgressViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table : UITableView!
    @IBOutlet var myNameLabel : UILabel!
    @IBOutlet var weightLabel : UILabel!
    @IBOutlet var weight2Label : UILabel!
    
    private var myWeightArray: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //TableView
        table.delegate = self
        table.dataSource = self
    
        //let saveData = NSUserDefaults.standardUserDefaults()

        //自分の名前を表示
        myNameLabel.text = PFUser.currentUser()!.username! as String
        
        //現在の体重を表示
        let firstWeight : Double = PFUser.currentUser()!.objectForKey("Weight") as! Double
        weightLabel.text = "\(firstWeight)"
        
        //目標体重を表示
        let Weight2 : Double = PFUser.currentUser()!.objectForKey("Weight2") as! Double
        weight2Label.text = "\(Weight2)"
        
        
        
            
        
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
        self.read()
    }

    
    //TableView設定
    // セルに表示するテキスト
    //let texts = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! WeightTableViewCell
        //let tweetLabel = tableView.viewWithTag(1) as! UILabel!
        //tweetLabel.textColor = UIColor.yellowColor()
        cell.myWeightLabel.text = myWeightArray[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myWeightArray.count
    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    
    func read(){
        
        let query:PFQuery = PFQuery(className: "Weight")
        query.whereKey("User", equalTo: (PFUser.currentUser())!)
        //query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                if let dataObjects: [PFObject] = objects! {
                    for dataObject in dataObjects {
                        self.myWeightArray.append(dataObject["WEIGHT"] as! String)
                        
                    }
                }
                self.table.reloadData()
            }
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
