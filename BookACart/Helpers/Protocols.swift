//
//  Protocols.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 22/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import Foundation

protocol BookAppointment {
    func bookAppointment(newAppointment:UserDummyData)
}

protocol UpdateAppointment {
       func updateAppointment(newAppointment:[UserDummyData])
}
