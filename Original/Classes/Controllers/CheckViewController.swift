//
//  CheckViewController.swift
//  Original
//
//  Created by Honami on 2016/02/26.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class CheckViewController: UIViewController {
    
    @IBOutlet var myNameLabel : UILabel!
    @IBOutlet var weightLabel : UILabel!
    @IBOutlet var weight2Label : UILabel!
    @IBOutlet var dateLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //NavigationBarを表示する
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        
        let saveData = NSUserDefaults.standardUserDefaults()
        
        //自分の名前を表示
        let myName = saveData.objectForKey("NAME")
        myNameLabel.text = myName as? String
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
