//
//  InviteViewController.swift
//  Original
//
//  Created by Honami on 2016/02/20.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit
import Accounts
import Parse

class InviteViewController: UIViewController, UITabBarControllerDelegate, UITextFieldDelegate{
    
    //var username:String!
    var userId : String!
    var date:String!
    let saveData = NSUserDefaults.standardUserDefaults()
    //@IBOutlet var pairUserName : UITextField!
    @IBOutlet var pairId : UITextField!
    @IBOutlet var error : UILabel!
    var yourName:String!
    var yourWeight:String!
    var yourId:String!
    


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        //TabBar
        
        // fontの設定
        let fontFamily: UIFont! = UIFont.systemFontOfSize(10)
        // 選択時の設定
        let selectedColor:UIColor = UIColor(red: 123.0/255.0, green: 68.0/255.0, blue: 145.0/255.0, alpha: 1)
        let selectedAttributes = [NSFontAttributeName: fontFamily, NSForegroundColorAttributeName: selectedColor]
        /// タイトルテキストカラーの設定
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, forState: UIControlState.Selected)
        /// アイコンカラーの設定
        UITabBar.appearance().tintColor = selectedColor
        
        //textField
        //self.pairUserName.delegate = self
        self.pairId.delegate = self
        
        //username = PFUser.currentUser()!.username! as String
        userId = PFUser.currentUser()!.objectId! as String
        date = PFUser.currentUser()!.objectForKey("Date") as! String

        

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
    
    //ID自分の取得
    
    @IBAction func shere(sender:UIButton){
        // ShareExtensionに渡すURLの用意
        // 共有する項目
        let shareWebsite = NSURL(string: "https://itunes.apple.com/jp/genre/ios/id36?mt=8")!
        
        let text1 = "【招待】\n対戦型ダイエットアプリ\n「You are FAT！」\n一緒に使いましょう！\n\n①まずはアプリをダウンロード\n\(shareWebsite)\n\n②まずは登録しよう\n＜期限＞を一緒の\n『\(date)』\nにしてね！\n\n③次に「設定」のタブを開こう！\n対戦相手を検索のところに\n『\(userId)』\nを入れてスタート！"
        
        
        
        
        //let shareImage = UIImage(named: "1.png")!
        
        
        let activityItems = [text1]
        
        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
            UIActivityTypePostToWeibo,
            UIActivityTypeSaveToCameraRoll,
            UIActivityTypePrint
        ]
        
        activityVC.excludedActivityTypes = excludedActivityTypes
        
        // UIActivityViewControllerを表示
        self.presentViewController(activityVC, animated: true, completion: nil)
    
    }
    
    
    @IBAction func search(){
        let query:PFQuery = PFUser.query()!
        //query.whereKey("username", equalTo: self.pairUserName.text!)
        query.whereKey("objectId", equalTo: self.pairId.text!)
        //query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                if let dataObjects: [PFObject] = objects! {
                    for dataObject in dataObjects {
                        self.yourName = dataObject["username"] as? String
                        self.saveData.setObject(self.yourName, forKey: "YNAME")
                        self.yourWeight = dataObject["WEIGHT"] as? String
                        self.saveData.setObject(self.yourWeight, forKey: "YWEIGHT")
                        self.error.text = "対戦相手がヒットしたよ！"
                        
                    }
                    
                }
            }
            
        }
        
    }

    // enter押すとキーボードをさげる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //画面をタッチしたらキーボードを下げる
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
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
