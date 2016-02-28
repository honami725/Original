//
//  ProfileViewController.swift
//  Original
//
//  Created by Honami on 2016/02/26.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet var myNameLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //TableView
        tableView.delegate = self
        tableView.dataSource = self

        
        let saveData = NSUserDefaults.standardUserDefaults()
        
        //自分の名前を表示
        let myName = saveData.objectForKey("NAME")
        myNameLabel.text = myName as? String
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TableView設定
    // セルに表示するテキスト
    //let texts = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // セルの内容を変更
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let saveData = NSUserDefaults.standardUserDefaults()
        let myTweet = saveData.objectForKey("tweet")
        let cell = tableView.dequeueReusableCellWithIdentifier("tweetCell", forIndexPath: indexPath)
        
        let myTweetLabel = tableView.viewWithTag(1) as! UILabel!
        myTweetLabel.text = myTweet as? String
        return cell
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
