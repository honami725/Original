//
//  RegistrationViewController.swift
//  Original
//
//  Created by Honami on 2016/02/20.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    //パスワード入力フィールド
    @IBOutlet var passwordTextField : UITextField!
    @IBOutlet var secondPasswordTextField : UITextField!
    @IBOutlet var passwordMachingLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //パスワード入力
        passwordTextField.secureTextEntry = true
        secondPasswordTextField.secureTextEntry = true

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func passwordMaching() {
        if passwordTextField.text != secondPasswordTextField.text {
            passwordMachingLabel.text = String("パスワードが一致しません")
        }
        
    }
    
    
    //戻るボタン
    @IBAction func goBack(sender: UIBarButtonItem){
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
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
