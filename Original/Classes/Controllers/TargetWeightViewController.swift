//
//  TargetWeightViewController.swift
//  Original
//
//  Created by Honami on 2016/02/26.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class TargetWeightViewController: UIViewController {
    @IBOutlet var label : UILabel!
    @IBOutlet var error : UILabel!
    var number : Double = 0
    var dotNum : Int = 0
    let saveData = NSUserDefaults.standardUserDefaults()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //小数点
    @IBAction func dot(){
        if dotNum  == 0 {
            dotNum = dotNum + 1
        }
    }
    
    //クリア
    @IBAction func clear(){
        number = 0
        dotNum = 0
        label.text = "\(number)"
        error.text = ""
    }
    
    
    //数字
    @IBAction func one(){
        if dotNum == 0{
            number = number * 10 + 1
            label.text = "\(number)"
        }else{
            number = number + pow(0.1,Double(dotNum))
            label.text = "\(number)"
            dotNum = dotNum + 1
        }
    }
    
    @IBAction func two(){
        if dotNum == 0{
            number = number * 10 + 2
            label.text = "\(number)"
        }else{
            number = number + 2*pow(0.1,Double(dotNum))
            label.text = "\(number)"
            dotNum = dotNum + 2
        }
    }
    
    @IBAction func three(){
        if dotNum == 0{
            number = number * 10 + 3
            label.text = "\(number)"
        }else{
            number = number + 3*pow(0.1,Double(dotNum))
            label.text = "\(number)"
            dotNum = dotNum + 3
        }
    }
    
    @IBAction func four(){
        if dotNum == 0{
            number = number * 10 + 4
            label.text = "\(number)"
        }else{
            number = number + 4*pow(0.1,Double(dotNum))
            label.text = "\(number)"
            dotNum = dotNum + 4
        }
    }
    
    
    @IBAction func five(){
        if dotNum == 0{
            number = number * 10 + 5
            label.text = "\(number)"
        }else{
            number = number + 5*pow(0.1,Double(dotNum))
            label.text = "\(number)"
            dotNum = dotNum + 5
        }
    }
    
    @IBAction func six(){
        if dotNum == 0{
            number = number * 10 + 6
            label.text = "\(number)"
        }else{
            number = number + 6*pow(0.1,Double(dotNum))
            label.text = "\(number)"
            dotNum = dotNum + 6
        }
    }
    
    
    @IBAction func seven(){
        if dotNum == 0{
            number = number * 10 + 7
            label.text = "\(number)"
        }else{
            number = number + 7*pow(0.1,Double(dotNum))
            label.text = "\(number)"
            dotNum = dotNum + 7
        }
    }
    
    @IBAction func eight(){
        if dotNum == 0{
            number = number * 10 + 8
            label.text = "\(number)"
        }else{
            number = number + 8*pow(0.1,Double(dotNum))
            label.text = "\(number)"
            dotNum = dotNum + 8
        }
    }
    
    
    @IBAction func nine(){
        if dotNum == 0{
            number = number * 10 + 9
            label.text = "\(number)"
        }else{
            number = number + 9*pow(0.1,Double(dotNum))
            label.text = "\(number)"
            dotNum = dotNum + 9
        }
    }
    
    
    
    
    @IBAction func zero(){
        if dotNum == 0{
            number = number * 10
            label.text = "\(number)"
        }else{
            dotNum = dotNum + 1
            print("\(dotNum)")
        }
        
    }
    
    //登録ボタン
    @IBAction func input(){
        if number == 0.0 || number >= 200.0{
            error.text = "正しい数値を入力してください!"
        }else{
            saveData.setDouble(number, forKey: "WEIGHT2")
            performSegueWithIdentifier("Push", sender: nil)
            
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
