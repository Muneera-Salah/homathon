//
//  StoreManagementViewViewController.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 21/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import UIKit

struct StoreStatistic {
    var timePeriod:String!
    var statistic: [StoreInfo]!
}
struct StoreInfo {
    var time:String!
    var numberOfCustomer: String!
}
class StoreManagementViewViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var storeStatistic: [StoreStatistic] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        tableView.tableFooterView = UIView()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        storeStatistic = [ StoreStatistic(timePeriod: "الفتره الصباحية", statistic: [
            StoreInfo(time: "٧ ص", numberOfCustomer: "١٥ متسوق"),
            StoreInfo(time: "٨ ص", numberOfCustomer: "١٠ متسوقين"),
            StoreInfo(time: "٩ ص", numberOfCustomer: "١٢ متسوق"),
            StoreInfo(time: "١٠ ص", numberOfCustomer: "٢٠ متسوق"),
            StoreInfo(time: "١١ ص", numberOfCustomer: "١٥ متسوق"),
            StoreInfo(time: "١٢ ص", numberOfCustomer: "١٢ متسوق"),
            
        ]), StoreStatistic(timePeriod: "الفتره المسائية", statistic: [
            StoreInfo(time: "١ م", numberOfCustomer: "١٥ متسوق"),
            StoreInfo(time: "٢ م", numberOfCustomer: "١٠ متسوقين"),
            StoreInfo(time: "٣ م", numberOfCustomer: "١٢ متسوق"),
            StoreInfo(time: "٤ م", numberOfCustomer: "٢٠ متسوق"),
            StoreInfo(time: "٥ م", numberOfCustomer: "١٥ متسوق"),
            StoreInfo(time: "٦ م", numberOfCustomer: "١٢ متسوق"),
        ]),  StoreStatistic(timePeriod: "منتصف الليل", statistic: [
            StoreInfo(time: "٧ ص", numberOfCustomer: "١٥ متسوق"),
            StoreInfo(time: "٨ ص", numberOfCustomer: "١٠ متسوقين"),
            StoreInfo(time: "٩ ص", numberOfCustomer: "١٢ متسوق"),
            StoreInfo(time: "١٠ ص", numberOfCustomer: "٢٠ متسوق"),
            StoreInfo(time: "١١ ص", numberOfCustomer: "١٥ متسوق"),
            StoreInfo(time: "١٢ ص", numberOfCustomer: "١٢ متسوق"),
            
        ])
        ]
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeStatistic[section].statistic.count
    }
    
    func  numberOfSections(in tableView: UITableView) -> Int {
        return storeStatistic.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return storeStatistic[section].timePeriod
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "GEDinkum-Bold-1", size: 14.0)
        header.textLabel?.textAlignment = NSTextAlignment.right
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DataTableViewCell
        cell.timeLabel.text = " مجموع المتسوقين في فتره " + storeStatistic[indexPath.section].statistic[indexPath.row].time + ":" + storeStatistic[indexPath.section].statistic[indexPath.row].numberOfCustomer

        return cell
    }
    
}
