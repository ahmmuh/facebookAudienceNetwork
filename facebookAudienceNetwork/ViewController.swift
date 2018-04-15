//
//  ViewController.swift
//  facebookAudienceNetwork
//
//  Created by Ahmed Mukhtar on 2018-04-09.
//  Copyright © 2018 Ahmed Mukhtar. All rights reserved.
//
// Rectangel: 1644981572217212_1649335825115120
// Banner:1644981572217212_1644983452217024
import UIKit
import FBAudienceNetwork
class ViewController: UIViewController,FBAdViewDelegate {

    
    @IBOutlet weak var ReklamArea: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let adView = FBAdView(placementID: "IMG_16_9_APP_INSTALL#1644981572217212_1649335825115120", adSize: kFBAdSizeHeight250Rectangle, rootViewController: self)
        
        adView.frame = CGRect(x: 0, y: 0, width: Int(self.view.frame.width), height: Int(adView.bounds.size.height))
        adView.delegate = self
        adView.loadAd()
        ReklamArea.addSubview(adView)
    }




}

