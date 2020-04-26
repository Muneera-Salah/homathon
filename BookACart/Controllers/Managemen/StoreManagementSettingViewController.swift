//
//  StoreManagementSettingViewController.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 21/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import UIKit

class StoreManagementSettingViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        let vc = storyboard?.instantiateViewController(identifier: "CustomerPassViewController") as! CustomerPassViewController
        HelperClass.showPopUp(vc, parent: self, alphaComponent: 1, hiddenNavigationBar: true, backgroundColor: .white)
    }
    
    @IBAction func readBarCode(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .camera
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    
}
