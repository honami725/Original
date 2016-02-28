//
//  OverViewController.swift
//  Original
//
//  Created by Honami on 2016/02/28.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class OverViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var scrollView: UIScrollView!
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //NavigationBarを隠す
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
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
