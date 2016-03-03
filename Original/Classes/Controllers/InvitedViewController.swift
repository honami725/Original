//
//  InvitedViewController.swift
//  Original
//
//  Created by Honami on 2016/02/28.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit
import Parse

class InvitedViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var textField : UITextField!
    @IBOutlet var error : UILabel!
    var pairId : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.textField.delegate = self
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent

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
        if textField.text == ""{
            error.text = "IDが入力されていません"
        }else{
            //saveData.setObject(name.text, forKey: "NAME")
            
            //自分の段にPairID記入
            let send:PFObject = PFObject(className: "Match")
            send["PairID"] = textField.text
            send["User"] = PFUser.currentUser()
            send.saveInBackground()
            
            //ペアの人の段にPairID記入
            //let query:PFQuery = PFQuery(className: "Match")
            //query.whereKey("MyID", equalTo: (Match.MyID)!)
            

                        
        }
    }
    
    

    //enter押したらキーボードが下がる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    
    //画面をタップしたらキーボードが下がる
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
