//
//  BookingCartViewController.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 21/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import UIKit


class BookingCartViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var UserAppointment: SkyFloatingLabelTextField!
    @IBOutlet weak var numberOfEscorts: SkyFloatingLabelTextField!
    var delegate:BookAppointment?
    var updateDelegate:UpdateAppointment?

    var userDataTimer:String = ""
    var pickStore:DummyData?
    var userDummyData:UserDummyData?
    var index:Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        setUI()
    }
    
    func setUI() {
        if userDummyData != nil {
            UserAppointment.text = userDummyData!.bookingTime
            numberOfEscorts.text = userDummyData!.numberOfEscorts
        }
        
        UserAppointment.textAlignment = .right
        numberOfEscorts.textAlignment = .right
    }
    
    
    func showFromDatePicker(){
        let initialDate: Date = Date()
        let dateAlert = UIAlertController(title: nil, message: "اختيار موعد", preferredStyle: .actionSheet)
        dateAlert.addDatePicker(mode: UIDatePicker.Mode.date, date: initialDate) { date in
            let fromFormatter = DateFormatter()
            fromFormatter.dateFormat = "MM/dd/yyyy"
            let initialDate = fromFormatter.string(from: date)
            
            self.userDataTimer = initialDate
        }
        
        let okAction = UIAlertAction(title: "تم", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.showFromTimePicker()
        }
        let cancelAction = UIAlertAction(title: "إلغاء", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
        }
        
        dateAlert.addAction(okAction)
        dateAlert.addAction(cancelAction)
        dateAlert.show()
    }
    
    func showFromTimePicker(){
        let initialDate: Date = Date()
        
        let timeAlert = UIAlertController(style: .actionSheet, title: "select_time")
        timeAlert.addDatePicker(mode: UIDatePicker.Mode.time, date: initialDate) { date in
            let fromFormatter = DateFormatter()
            fromFormatter.dateFormat = "hh:mm"
            let initialDate = fromFormatter.string(from: date)
            self.UserAppointment.placeholder = ""
            self.UserAppointment.text = "\(self.userDataTimer) \(initialDate)"
        }
        let okAction = UIAlertAction(title: "تم", style: UIAlertAction.Style.default) {
            UIAlertAction in
            
            
        }
        let cancelAction = UIAlertAction(title: "إلغاء", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            
        }
        timeAlert.addAction(okAction)
        timeAlert.addAction(cancelAction)
        timeAlert.show()
    }
    
    @IBAction func showDateTimerPicker(_ sender: Any) {
        showFromDatePicker()
    }
    
     func updateAppointment() {
        let Appointments = GetDummyData.instance.updateAnAppointment(date: UserAppointment.text!, numberOfEscorts: numberOfEscorts.text!, index: index)
        updateDelegate?.updateAppointment(newAppointment: Appointments)
    }
 
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.numberOfEscorts.placeholder = ""
        return true
    }
    @IBAction func confirmAppointment(_ sender: Any) {
        if UserAppointment.text! != "" && numberOfEscorts.text != "" {
            if pickStore != nil {
                let newAppointment = UserDummyData(storeName: pickStore!.storeName, bookingTime: UserAppointment.text!, storeLogo: pickStore!.storeLogo, numberOfEscorts:  numberOfEscorts.text!)
                delegate?.bookAppointment(newAppointment:newAppointment)
            } else if userDummyData != nil {
                updateAppointment()
                self.dismiss(animated: true, completion: nil)
            }
            
        } else {
            HelperClass.showAlert(title: nil, message: "All field are required ", controller: self)
        }
    }
    
}
