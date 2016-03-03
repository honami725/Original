//
//  CheckViewController.swift
//  Original
//
//  Created by Honami on 2016/02/26.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit
import Parse

class CheckViewController: UIViewController {
    
    @IBOutlet var myNameLabel : UILabel!
    @IBOutlet var passwordLabel : UILabel!
    @IBOutlet var weightLabel : UILabel!
    @IBOutlet var weight2Label : UILabel!
    @IBOutlet var dateLabel : UILabel!
    var myId : String!
    let saveData = NSUserDefaults.standardUserDefaults()
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        
        //自分の名前を表示
        let myName = saveData.objectForKey("NAME")
        myNameLabel.text = myName as? String
        
        
        //パスワードを表示
        let password = saveData.objectForKey("PASS")
        passwordLabel.text = password as? String
        
        //現在の体重を表示
        let weight : Double = saveData.doubleForKey("WEIGHT")
        weightLabel.text = "\(weight)"
        

        
        
        //目標体重を表示
        let weight2 : Double = saveData.doubleForKey("WEIGHT2")
        weight2Label.text = "\(weight2)"
        
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
    
    //登録ボタン
    @IBAction func input(){
       self.create()
    }
    
    
        
    
    //生成
    func create() {
        let doubleWeight : Double = saveData.doubleForKey("WEIGHT")
        let doubleWeight2 : Double = saveData.doubleForKey("WEIGHT2")
 //               print("aaaa")
        //乱数を取得する
        let random = arc4random_uniform(1000)
         myId = String(random)
        //myId = "12345"
    
 //       print("aaaa")
        
        let object: PFUser = PFUser()
        object.username = myNameLabel.text
        object.password = passwordLabel.text
        //object["MyID"] = myId
  //              print("aaaa")
        object["Weight"] = doubleWeight
        object["Weight2"] = doubleWeight2
        object["Date"] = dateLabel.text
        object.signUpInBackgroundWithBlock { _ in
            print("sign up")
            PFUser.logInWithUsernameInBackground(self.myNameLabel.text!, password: self.passwordLabel.text!){
                (user, error) -> Void in
                if user != nil {
                    let send:PFObject = PFObject(className: "Match")
                    
                    // カラムを作成する。ここでは、ユーザーとTweet内容用のカラムを作成。
                    send["MyID"] = self.myId
                    send["User"] = PFUser.currentUser()
                    // Parseに送信
                    //             print("aaaa")
                    send.saveInBackground()

                }else {
                    print("ログインできません！")
                }

            }
            
            
                   }
  //      print("aaaa")
        


    //            print("aaaa")
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