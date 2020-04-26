//
//  BookingCell.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 21/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import UIKit

class BookingCell: UITableViewCell {
    
    @IBOutlet weak var appointmentInfo: UILabel!
    @IBOutlet weak var appointmentTime: UILabel!
    @IBOutlet weak var storeLogo: UIImageView!
    
    var controller:UserBookingViewController?
    var storeInfo:UserDummyData?
    var index: Int = -1
    override func awakeFromNib() {
        super.awakeFromNib()
        storeLogo.layer.borderWidth = 0.5
        storeLogo.layer.masksToBounds = false
        storeLogo.layer.borderColor = UIColor.black.cgColor
        storeLogo.layer.cornerRadius = storeLogo.frame.height/2
        storeLogo.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func editAppointment(_ sender: UIButton) {
        let vc = controller?.storyboard?.instantiateViewController(withIdentifier: "BookingCartViewController") as! BookingCartViewController
        vc.userDummyData = storeInfo
        vc.index = index
        HelperClass.showPopUp(vc, parent: controller!)
    }
    
    @IBAction func cancelAppointment(_ sender: UIButton) {
        
    }
      
}

