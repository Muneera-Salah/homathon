//
//  BarCodeViewController.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 22/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import UIKit

class BarCodeViewController: UIViewController {

    @IBOutlet var barCodeImage: UIImageView!
    @IBOutlet var dateAndTimeLabel: UILabel!
    @IBOutlet var storeName: UILabel!
    
    var userDummyData:UserDummyData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setUI()
      
    }
    
    func setUI() {
        if userDummyData != nil {
            dateAndTimeLabel.text = "الموعد:" + userDummyData!.bookingTime 
            storeName.text = "  تم حجز موعد بنجاح في \(userDummyData!.storeName)"
        }
    }
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
