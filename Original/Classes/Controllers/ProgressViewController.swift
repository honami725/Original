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
    @IBOutlet var weightLabel : UILabel!
    @IBOutlet var weight2Label : UILabel!
    let saveData = NSUserDefaults.standardUserDefaults()

    
    private var myWeightArray: [String] = [String]()
    private var myTweetArray: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        //TableView
        table.delegate = self
        table.dataSource = self

        
        
        //初期の体重を表示
        let weight : Double = saveData.doubleForKey("WEIGHT")
        weightLabel.text = "\(weight)"
        
        //目標体重を表示
        let weight2 : Double = saveData.doubleForKey("WEIGHT2")
        weight2Label.text = "\(weight2)"
        
        
        
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
        self.weightRead()
        self.tweetRead()
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TableViewCell
        cell.myTweetLabel.text = myTweetArray[indexPath.row]
        cell.myWeightLabel.text = myWeightArray[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myTweetArray.count
    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tweetRead(){
        
        let query:PFQuery = PFQuery(className: "Tweet")
        query.whereKey("User", equalTo: (PFUser.currentUser())!)
        query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                if let dataObjects: [PFObject] = objects! {
                    for dataObject in dataObjects {
                        self.myTweetArray.append(dataObject["Tweet"] as! String)
                        
                    }
                }
                self.table.reloadData()
            }
        }
    }
    
    func weightRead(){
        
        let query:PFQuery = PFQuery(className: "Weight")
        query.whereKey("User", equalTo: (PFUser.currentUser())!)
        query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                if let dataObjects: [PFObject] = objects! {
                    for dataObject in dataObjects {
                        self.myWeightArray.append(dataObject["Weight"] as! String)
                        
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
