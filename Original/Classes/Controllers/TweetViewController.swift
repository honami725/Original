//
//  TweetViewController.swift
//  Original
//
//  Created by Honami on 2016/02/26.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    var tweetArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    @IBOutlet var textField : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if saveData.arrayForKey("tweet") != nil{
            tweetArray = saveData.arrayForKey("tweet")!
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tweetButton(){
        saveData.setObject(tweetArray, forKey:"tweet")

        
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
