//
//  OverViewController.swift
//  Original
//
//  Created by Honami on 2016/02/28.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class OverViewController: UIViewController, UIScrollViewDelegate {
    
    
    var pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.]
        
        //ステータスバー
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        
        //NavigationBarを隠す
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        

        // UIScrollView
        let scrollView = UIScrollView(frame: CGRectMake(0, 0, self.view.frame.size.width, 360))
        print("scrollView.frame = \(scrollView.frame)")
        
        let numImage = 3
        let imageFiles = ["image1.png", "image2.png", "image3.png"]
        for var i=0; i<numImage; i++ {
            let image = UIImage(named: imageFiles[i])!
            let imageView = UIImageView(image: image)
            imageView.frame.origin = CGPointMake(/*image.size.width*/self.view.frame.size.width * CGFloat(i), 0)
            imageView.frame.size = /*image.size*/CGSizeMake(self.view.frame.size.width, 360)
            //imageView.tag = i + 1
            scrollView.addSubview(imageView)
        }
        let widthImage: CGFloat = self.view.frame.size.width
        let heightImage: CGFloat = 180
        scrollView.contentSize = CGSizeMake(widthImage * CGFloat(numImage), heightImage)
        scrollView.pagingEnabled = true // ページスクロールON
        scrollView.showsHorizontalScrollIndicator = false   // 横方向のスクロールインジケータOFF
        scrollView.showsVerticalScrollIndicator = false   // 縦方向のスクロールインジケータOFF
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        // UIPageControl
        let heightPageControl = 15
        pageControl.frame = CGRectMake(0, CGFloat(380 - heightPageControl), self.view.frame.size.width, CGFloat(heightPageControl))
        //pageControl.backgroundColor = UIColor.orangeColor()
        pageControl.userInteractionEnabled = false
        pageControl.numberOfPages = numImage
        pageControl.currentPage = 0
        self.view.addSubview(pageControl)
        
        

        
        
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
    
    // UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {

        // このメソッドやたら呼ばれるので、ページ切り替え終了で呼ばれるscrollViewDidEndDeceleratingでページ数を設定する
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
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
