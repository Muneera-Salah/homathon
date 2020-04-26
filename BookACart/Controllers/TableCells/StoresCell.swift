//
//  StoreCell.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 21/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import UIKit

class StoresCell: UITableViewCell {
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeStatus: UILabel!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var storeLogo: UIImageView!
    
    var controller:StoresListViewController?
    var pickStore:DummyData?
    
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
    
    @IBAction func bookAppointment(_ sender: UIButton) {
        let vc = controller?.storyboard?.instantiateViewController(withIdentifier: "BookingCartViewController") as! BookingCartViewController
        vc.delegate = controller
        vc.pickStore = pickStore
        HelperClass.showPopUp(vc, parent: controller!)
    }
}
