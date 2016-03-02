//
//  ProfileViewController.swift
//  Original
//
//  Created by Honami on 2016/02/26.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var table : UITableView!
    @IBOutlet var myNameLabel : UILabel!
    
    private var myTweetArray: [String] = [String]()
    //private var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //TableView
        table.dataSource = self
        table.delegate = self
        
        
        

        
        //let saveData = NSUserDefaults.standardUserDefaults()
        
        //自分の名前を表示
        myNameLabel.text = PFUser.currentUser()!.username! as String
        
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
    
    // セルの行数
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TableViewCell
                //let tweetLabel = tableView.viewWithTag(1) as! UILabel!
                //tweetLabel.textColor = UIColor.yellowColor()
                cell.myTweetLabel.text = myTweetArray[indexPath.row]
                cell.backgroundColor = UIColor.clearColor()
        
        
        
                return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return myTweetArray.count
    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    // セルの内容を変更
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!
//        //let tweetLabel = tableView.viewWithTag(1) as! UILabel!
//        //tweetLabel.text = myWeightArray[indexPath.row]
//        
//        cell.textLabel?.text = "hogehoge"
//        
//        NSLog("hoge")
//        
//        return cell
//    }
    
    func read(){
        
        let query:PFQuery = PFQuery(className: "Tweet")
        query.whereKey("User", equalTo: (PFUser.currentUser())!)
        //query.orderByAscending("createdAt")
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
    
    
    
    
    
//    func read(){
//        let query = PFQuery(className: "Tweet")
//        query.whereKey("User", equalTo: (PFUser.currentUser())!)
//        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
//            if error == nil {
//                if let dataObjects: [PFObject] = objects! {
//                    for dataObject in dataObjects {
//                        self.myWeightArray.append(dataObject["Tweet"] as! String)
//                    }
//                    print("contentArray...\(self.myWeightArray)")
//                    
//                }
//                
//                self.tableView.reloadData()
//            }
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
