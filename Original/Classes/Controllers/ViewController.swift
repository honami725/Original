//
//  ViewController.swift
//  Original
//
//  Created by Honami on 2016/02/17.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var myNameLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //自分の名前を表示
        let saveData = NSUserDefaults.standardUserDefaults()
        let myName = saveData.objectForKey("NAME")
        myNameLabel.text = myName as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

