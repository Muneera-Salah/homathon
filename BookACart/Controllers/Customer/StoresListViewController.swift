//
//  StoreListViewController.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 21/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import UIKit

class StoresListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,BookAppointment {
    
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var listOfStores:[DummyData] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setUI()
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    
    func setUI() {
        listOfStores = GetDummyData().GetlistOfStores()
        tableView.reloadData()
        
        searchBar.barTintColor = UIColor.white
        searchBar.backgroundColor = UIColor.white
        
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 15
        searchBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        let searchTextField: UITextField? = searchBar.value(forKey: "searchField") as? UITextField
        searchTextField!.backgroundColor = UIColor.white
        searchTextField?.borderStyle = .none
        searchTextField?.textAlignment = .right
        searchTextField?.text = "البحث عن متجر"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfStores.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StoresCell
        cell.storeNameLabel.text = listOfStores[indexPath.row].storeName
        cell.storeStatus.text = listOfStores[indexPath.row].isAvailable ? "متاح":"مشغول"
        cell.storeStatus.textColor = listOfStores[indexPath.row].isAvailable ? BookCartColor.greenColor:UIColor.red
        cell.storeLogo.image =  listOfStores[indexPath.row].storeLogo!
        let buttonTitle = listOfStores[indexPath.row].isAvailable ? "حجز الان":"احجز لاحقا"
        let backgroundColor = listOfStores[indexPath.row].isAvailable ? BookCartColor.AppColor:UIColor.gray
        cell.bookButton.setTitle(buttonTitle, for: .normal)
        cell.bookButton.backgroundColor = backgroundColor
        cell.controller = self
        cell.pickStore = listOfStores[indexPath.row]
        return cell
    }
    
    func bookAppointment(newAppointment: UserDummyData) {
        GetDummyData.instance.addNew(appointment: newAppointment)
        self.dismiss(animated: true, completion: nil)
        let vc = storyboard?.instantiateViewController(identifier: "BarCodeViewController") as! BarCodeViewController
        vc.userDummyData = newAppointment
        HelperClass.showPopUp(vc, parent: self, alphaComponent: 1, hiddenNavigationBar: true,backgroundColor: UIColor.white)
        
    }
    
}
