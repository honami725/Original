//
//  RegistrationViewController.swift
//  Original
//
//  Created by Honami on 2016/02/20.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var name : UITextField!
    @IBOutlet var error : UILabel!
    let saveData = NSUserDefaults.standardUserDefaults()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.name.delegate = self
        
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
    
    //登録ボタン
    @IBAction func input(){
        if name.text == ""{
            error.text = "ユーザー名が入力されていません"
        }else{
            saveData.setObject(name.text, forKey: "NAME")
            performSegueWithIdentifier("Push", sender: nil)

        }
    }
    
    
    
    
    
    // enter押すとキーボードをさげる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    
    //画面をタップするとキーボードをさげる
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
