//
//  otherViewController.swift
//  facebookAudienceNetwork
//
//  Created by Ahmed Mukhtar on 2018-04-14.
//  Copyright © 2018 Ahmed Mukhtar. All rights reserved.
// helsida reklam: 1644981572217212_1649345158447520
// Video: VID_HD_16_9_46S_APP_INSTAL
// Native ads: 1644981572217212_1649397158442320

import UIKit
import FBAudienceNetwork
class otherViewController: UIViewController, FBInterstitialAdDelegate, FBNativeAdDelegate{

    @IBOutlet weak var lillaIconLable: UIImageView!
    
    @IBOutlet weak var firsLable: UILabel!
    
    @IBOutlet weak var secondLable: UILabel!
    
    @IBOutlet weak var fbMediaView: FBMediaView!
    @IBOutlet weak var beforeMoreText: UILabel!
    
    @IBOutlet weak var moreTextField: UILabel!
    
    @IBOutlet weak var btnlable: UIButton!
    
    @IBOutlet weak var KeeperView: UIView!
    
    var interstitialAd : FBInterstitialAd?
    var nativeAd : FBNativeAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interstitialAd = FBInterstitialAd(placementID: "VID_HD_16_9_15S_APP_INSTALL#1644981572217212_1649365478445488")
      
        self.interstitialAd?.delegate = self
        self.interstitialAd?.load()
        //Native ads
        self.nativeAd = FBNativeAd.init(placementID: "IMG_16_9_APP_INSTALL#1644981572217212_1649397158442320")
        self.nativeAd?.delegate = self
        nativeAd?.mediaCachePolicy = FBNativeAdsCachePolicy.all
        self.nativeAd?.load()
    }
    func interstitialAdDidLoad(_ interstitialAd: FBInterstitialAd) {
        interstitialAd.show(fromRootViewController: self)
    }
    func interstitialAdDidClose(_ interstitialAd: FBInterstitialAd) {
        nativeAd?.load()
    }
    func nativeAd(_ nativeAd: FBNativeAd, didFailWithError error: Error) {
        nativeAd.load()
    }
    func nativeAdDidLoad(_ nativeAd: FBNativeAd) {
        nativeAd.registerView(forInteraction: KeeperView, with: self, withClickableViews: [fbMediaView, btnlable])
        self.fbMediaView.nativeAd = nativeAd
        self.nativeAd?.icon?.loadAsync(block: {(img: UIImage?)in
            self.lillaIconLable.image = img
        })
        self.firsLable.text = self.nativeAd?.title
        self.secondLable.text = "Sponser"
        self.moreTextField.text = self.nativeAd?.body
        self.beforeMoreText.text = self.nativeAd?.socialContext

        self.btnlable.setTitle(self.nativeAd?.callToAction, for: .normal)
        
        KeeperView.isHidden = true
        
//
    }
    
    
}
