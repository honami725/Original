//
//  StartViewController.swift
//  Original
//
//  Created by Honami on 2016/02/27.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    

    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        
        //Navigationbar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColorFromRGB(0x7b4490)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
    }
    
    //ステータスバーを白くする
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        // trueの場合はステータスバー非表示
        return false;
    }

    
    @IBAction func input(){
        performSegueWithIdentifier("Push", sender: nil)
        
        
//        if saveDate.arrayForKey("SKIP") != nil{
//            performSegueWithIdentifier("Push", sender: nil)
//        }else{
//            performSegueWithIdentifier("Skip", sender: nil)
//
//        }
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