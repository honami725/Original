//
//  LogInViewController.swift
//  Original
//
//  Created by Honami on 2016/03/01.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var usernameTextField : UITextField!
    @IBOutlet var passwordTextField : UITextField!
    @IBOutlet var error : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //textField
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordTextField.secureTextEntry = true
        
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
    
    
    @IBAction func login(sender:UIButton){
        PFUser.logInWithUsernameInBackground(self.usernameTextField.text!, password: self.passwordTextField.text!){
            (user, error) -> Void in
            if user != nil {
                self.performSegueWithIdentifier("Push", sender: nil)
            }else {
                self.error.text = "ログインできません！"
        }
        
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
