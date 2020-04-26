//
//  DummyData.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 21/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import Foundation
import UIKit
class GetDummyData {
    
    var listOfBooking:[UserDummyData] = []
    static let instance = GetDummyData()
    
    func GetlistOfStores() -> [DummyData] {
        var  listOfStores:[DummyData] = []
        let store1 = DummyData(storeName: "أسواق العثيم - فرع النسيم", isAvailable: true, storeLogo:#imageLiteral(resourceName: "mail"))
        let store2 = DummyData(storeName: "أسواق التميمي - فرع النسيم", isAvailable: true, storeLogo:#imageLiteral(resourceName: "TamimMarkets"))
        let store3 = DummyData(storeName: "أسواق الجزيرة - فرع النسيم", isAvailable: false, storeLogo:#imageLiteral(resourceName: "20vUPH2y_400x400"))
        let store4 = DummyData(storeName: "الدانوب - فرع النسيم", isAvailable: true, storeLogo:#imageLiteral(resourceName: "Danube"))
        let store5 = DummyData(storeName: "كارفور - فرع النسيم", isAvailable: false, storeLogo: #imageLiteral(resourceName: "mail"))
        let store6 = DummyData(storeName: "لولو ماركت - فرع النسيم", isAvailable: true, storeLogo: #imageLiteral(resourceName: "mail"))
        let store7 = DummyData(storeName: "مانويل ماركت - فرع النسيم", isAvailable: false, storeLogo: #imageLiteral(resourceName: "mail"))
        let store8 = DummyData(storeName: "حصيل - فرع النسيم", isAvailable: false, storeLogo: #imageLiteral(resourceName: "mail"))
        let store9  = DummyData(storeName: "سلة البساتين - فرع النسيم", isAvailable: true, storeLogo: #imageLiteral(resourceName: "mail"))

        
        listOfStores.append(store1)
        listOfStores.append(store2)
        listOfStores.append(store3)
        listOfStores.append(store4)
        listOfStores.append(store5)
        listOfStores.append(store6)
        listOfStores.append(store7)
        listOfStores.append(store8)
        listOfStores.append(store9)
        
        return listOfStores
    }
    
    func getInitialListOfBooking() -> [UserDummyData] {
        listOfBooking = []
        let book1 = UserDummyData(storeName: "أسواق العثيم", bookingTime: "04/24/2020 02:30", storeLogo: #imageLiteral(resourceName: "mail"), numberOfEscorts: "1")
        listOfBooking.append(book1)
        
        return listOfBooking
    }
    
    func addNew(appointment:UserDummyData) {
        
        listOfBooking.append(appointment)
    }
    
    func updateAnAppointment(date:String, numberOfEscorts:String,index:Int) -> [UserDummyData] {
        var listOfAppointment:[UserDummyData] = []
        listOfAppointment.append(contentsOf: GetDummyData.instance.getAllAppointment())
        listOfAppointment.append(contentsOf: GetDummyData().getInitialListOfBooking())
        listOfAppointment[index].bookingTime = date
        listOfAppointment[index].numberOfEscorts = numberOfEscorts
        listOfBooking.append(contentsOf: listOfAppointment)

        return listOfBooking
    }
    

    func getAllAppointment() -> [UserDummyData] {
        return listOfBooking
    }
    
    
}

class UserDummyData {
    var storeName:String = ""
    var storeLogo:UIImage? = nil
    var bookingTime:String = ""
    var numberOfEscorts:String = ""
    
    init(storeName:String, bookingTime:String, storeLogo:UIImage?, numberOfEscorts:String) {
        self.storeName = storeName
        self.bookingTime = bookingTime
        self.storeLogo = storeLogo
        self.numberOfEscorts = numberOfEscorts
        
    }
}

class DummyData {
    var storeName:String = ""
    var isAvailable:Bool = false
    var storeLogo:UIImage? = nil
    init(storeName:String, isAvailable:Bool, storeLogo:UIImage?) {
        self.storeName = storeName
        self.isAvailable = isAvailable
        self.storeLogo = storeLogo
    }
}
