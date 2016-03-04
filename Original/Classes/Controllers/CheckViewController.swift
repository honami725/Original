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
    var weightDate : String!
    var nowDate : String!
//    var doubleWeight : Double = 0.0
//    var doubleWeight2 : Double = 0.0
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
        
        //現在日時の取得
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        let now = NSDate()
        nowDate = dateFormatter.stringFromDate(now)
        
        
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
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if (segue.identifier == "Segue") {
//            // SecondViewControllerクラスをインスタンス化してsegue（画面遷移）で値を渡せるようにバンドルする
//            let secondView : ViewController = segue.destinationViewController as! ViewController
//            // secondView（バンドルされた変数）に受け取り用の変数を引数とし_paramを渡す（_paramには渡したい値）
//            // この時SecondViewControllerにて受け取る同型の変数を用意しておかないとエラーになる
//            secondView.id = self.myId
//            
//        }
//    }
    
    //登録ボタン
    @IBAction func input(){
        
        saveData.setInteger(1, forKey: "SKIP")
        saveData.removeObjectForKey("YNAME")
        saveData.removeObjectForKey("YWEIGHT")
        let object: PFUser = PFUser()
        object.username = myNameLabel.text
        object.password = passwordLabel.text
        
        
        
        let doubleWeight = saveData.doubleForKey("WEIGHT")
        let doubleWeight2 = saveData.doubleForKey("WEIGHT2")
        let doubleWeightDate = doubleWeight - doubleWeight2
        weightDate = String(doubleWeightDate)
        
        
        object["weight"] = doubleWeight2
        object["createdDate"] = nowDate
        object["Date"] = dateLabel.text
        object["WEIGHT"] = weightDate
        object.signUpInBackgroundWithBlock { _ in
            print("sign up")
            PFUser.logInWithUsernameInBackground(self.myNameLabel.text!, password: self.passwordLabel.text!){
                (user, error) -> Void in
                if user != nil {
                }else {
                    print("ログインできません！")
                }
                
            }
            self.performSegueWithIdentifier("Segue", sender: nil)

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