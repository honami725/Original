//
//  SetUpViewController.swift
//  Original
//
//  Created by Honami on 2016/02/20.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class SetUpViewController: UIViewController {
    
    @IBOutlet var myNameLabel:UILabel!
    @IBOutlet var dateLabel:UILabel!
    let saveDate = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //自分の名前を表示
        let saveData = NSUserDefaults.standardUserDefaults()
        let myName = saveData.objectForKey("NAME")
        myNameLabel.text = myName as? String
        
        //期限を表示
        let date = saveData.objectForKey("DATE")
        dateLabel.text = date as? String

        
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
    
    @IBAction func input(){
            saveDate.setInteger(1, forKey: "SKIP")
            performSegueWithIdentifier("Push", sender: nil)
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
