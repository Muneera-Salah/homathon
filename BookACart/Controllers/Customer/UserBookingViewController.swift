//
//  UserBookingViewController.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 21/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import UIKit

class UserBookingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
  
    var listOfBooking:[UserDummyData] = []
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "حجوزاتي"
    }
    
    override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }
    
    
    func getData() {
        listOfBooking = []
        listOfBooking.append(contentsOf: GetDummyData.instance.getAllAppointment())
        listOfBooking.append(contentsOf: GetDummyData().getInitialListOfBooking())
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfBooking.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BookingCell
        cell.appointmentTime.text = listOfBooking[indexPath.row].bookingTime
        cell.appointmentInfo.text = listOfBooking[indexPath.row].storeName
        cell.storeLogo.image = listOfBooking[indexPath.row].storeLogo
        cell.controller = self
        cell.storeInfo = listOfBooking[indexPath.row]
        cell.index = indexPath.row
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(identifier: "BarCodeViewController") as! BarCodeViewController
        vc.userDummyData = listOfBooking[indexPath.row]
        HelperClass.showPopUp(vc, parent: self, alphaComponent: 1, hiddenNavigationBar: true,backgroundColor: UIColor.white)
    }
}
