//
//  ZoomScreenViewController.swift
//  NetLog
//
//  Created by ENES AKSOY on 20.02.2021.
//  Copyright © 2021 Enes Aksoy. All rights reserved.
//

import UIKit

class ZoomScreenViewController:  UIViewController, UIScrollViewDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollImg: UIScrollView!
    
    // MARK: - Constants
    
    var imageUrl: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        let vWidth = self.view.frame.width
        let vHeight = self.view.frame.height
        
        scrollImg.delegate = self
        scrollImg.frame = CGRect(x: 0, y: 0, width: vWidth, height: vHeight)
        scrollImg.backgroundColor = UIColor(red: 90, green: 90, blue: 90, alpha: 0.90)
        scrollImg.alwaysBounceVertical = false
        scrollImg.alwaysBounceHorizontal = false
        scrollImg.showsVerticalScrollIndicator = true
        scrollImg.flashScrollIndicators()
        
        scrollImg.minimumZoomScale = 1.0
        scrollImg.maximumZoomScale = 10.0
        
        imageView!.layer.cornerRadius = 11.0
        imageView!.clipsToBounds = false
        scrollImg.addSubview(imageView!)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    // MARK: - Actions
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
