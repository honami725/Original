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

class InviteViewController: UIViewController {
    
    var getId : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        
        print("aaaa")
        print("aaaa")


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
    
    @IBAction func shere(sender:UIButton){
        // ShareExtensionに渡すURLの用意
        // 共有する項目
        
        let text1 = "【招待】\n対戦型ダイエットアプリ「You are FAT！」\n一緒に使いましょう！\n\n①まずはアプリをダウンロード\n②ダウンロードしたら「招待された方」をクリックして『\(getId)』を入れてね！"
        let shareWebsite = NSURL(string: "https://itunes.apple.com/jp/genre/ios/id36?mt=8")!
        //let shareImage = UIImage(named: "1.png")!
        
        let activityItems = [text1, shareWebsite]
        
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
