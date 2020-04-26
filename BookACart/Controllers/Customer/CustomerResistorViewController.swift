//
//  CustomerResistorViewController.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 21/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import UIKit

class CustomerResistorViewController: UIViewController {

    @IBOutlet var userName: SkyFloatingLabelTextField!
    @IBOutlet var phoneNumber: SkyFloatingLabelTextField!
    @IBOutlet var emailAddress: SkyFloatingLabelTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true

    }

    func setUI() {
        userName.textAlignment = .right
        phoneNumber.textAlignment = .right
        emailAddress.textAlignment = .right

    }

}
