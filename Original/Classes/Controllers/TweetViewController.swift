//
//  TweetViewController.swift
//  Original
//
//  Created by Honami on 2016/02/26.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit
import Parse

class TweetViewController: UIViewController, UITextFieldDelegate {
    
    let saveData = NSUserDefaults.standardUserDefaults()
    @IBOutlet var textField : UITextField!
    @IBOutlet var error : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        
        self.textField.delegate = self
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
    
    @IBAction func tweetButton(){
        if textField.text == ""{
            error.text = "何も記入していません！"
        }else{
            
            let send:PFObject = PFObject(className: "Tweet")
            
            
            // カラムを作成する。ここでは、ユーザーとTweet内容用のカラムを作成。
            send["Tweet"] = textField.text
            send["User"] = PFUser.currentUser()
            
            // Parseに送信
            send.saveInBackground()
            
            //saveData.setDouble(number, forKey: "weightData")
            performSegueWithIdentifier("Push", sender: nil)
            //saveData.setObject(textField.text, forKey:"tweet")

        }
    }
    
    //enter押すとキーボードをさげる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    //画面をタップしたらキーボードをさげる
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
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
