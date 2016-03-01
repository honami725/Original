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
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet var myNameLabel : UILabel!
    @IBOutlet var weightLabel : UILabel!
    @IBOutlet var weight2Label : UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //TableView
        tableView.delegate = self
        tableView.dataSource = self
    
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
        let weight : Double = saveData.doubleForKey("weightData")
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        
        let label = tableView.viewWithTag(1) as! UILabel!
        label.text = "\(weight)"

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
