//
//  StoreResistorViewController.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 21/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import UIKit

class StoreResistorViewController: UIViewController {
    
    @IBOutlet var storeName: SkyFloatingLabelTextField!
    @IBOutlet weak var storeLocation: SkyFloatingLabelTextField!
    @IBOutlet weak var storeSpace: SkyFloatingLabelTextField!
    @IBOutlet weak var customerTimeEstimateInStore: SkyFloatingLabelTextField!
    @IBOutlet weak var allowNumberOfCustomer: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setUI()
    }
    
    func setUI() {
        storeName.textAlignment = .right
        storeSpace.textAlignment = .right
        storeLocation.textAlignment = .right
        customerTimeEstimateInStore.textAlignment = .right
        allowNumberOfCustomer.textAlignment = .right
    }
}

