//
//  HelperClass.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 21/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import Foundation
import UIKit
class HelperClass {

    static func showPopUp(_ popup: UIViewController, parent: UIViewController, alphaComponent:CGFloat = 0.4 , hiddenNavigationBar:Bool = true,backgroundColor:UIColor = .black ){
          popup.view.backgroundColor = backgroundColor.withAlphaComponent(alphaComponent)
          let nav = UINavigationController(rootViewController: popup)
          nav.setNavigationBarHidden(hiddenNavigationBar, animated: false)
          let presStyle: UIModalPresentationStyle = (UIDevice.current.systemVersion as NSString).integerValue == 7 ? .currentContext : .overCurrentContext
          nav.modalPresentationStyle = presStyle
          parent.present(nav, animated: true, completion: nil)
      }
    
    static func showAlert(title:String?, message:String, controller:UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction (title: "إلغاء", style: .default, handler: nil)
        alert.addAction(alertAction)
        controller.present(alert, animated:true, completion:nil)
    }
}
