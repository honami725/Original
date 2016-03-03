//
//  ProfileViewController.swift
//  Original
//
//  Created by Honami on 2016/02/26.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController{
    
    @IBOutlet var myNameLabel : UILabel!
    @IBOutlet var yourNameLabel : UILabel!
    @IBOutlet var error : UILabel!
    @IBOutlet var dateLabel : UILabel!
    @IBOutlet var createdDateLabel : UILabel!
    let saveData = NSUserDefaults.standardUserDefaults()
    
    private var myTweetArray: [String] = [String]()
    //private var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        
        //NavigationBarを表示する
       self.navigationController?.setNavigationBarHidden(true, animated: true)
        

        
        

        
        //let saveData = NSUserDefaults.standardUserDefaults()
        
        //自分の名前を表示
        myNameLabel.text = PFUser.currentUser()!.username! as String
    
        //相手の名前を表示
        let yourName = saveData.objectForKey("YNAME")
        if yourName == nil {
            self.yourNameLabel.text = "名無し"
            error.text = "対戦相手が登録されていないよ！"
        }else{
            self.yourNameLabel.text = yourName as? String
            error.text = ""
        }
        
        //期限の表示
        let date = saveData.objectForKey("DATE")
        dateLabel.text = date as? String
        
        //開始日の表示
        let Date = PFUser.currentUser()!.objectForKey("createdDate") as! String
        createdDateLabel.text = Date

        

    
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
    }

    @IBAction func signOut(sender: AnyObject) {
        PFUser .logOut() // ログアウトの処理はこれだけでOK
        self.navigationController!.popToRootViewControllerAnimated(true)
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
