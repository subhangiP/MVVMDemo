//
//  ContactModel.swift
//  MVVMDemo
//
//  Created by Subhangi Pawar on 27/05/19.
//  Copyright © 2019 Subhangi Pawar. All rights reserved.
//

import UIKit

class ResponseModel: Decodable {
    var contacts = [ContactModel]()
    
    init(contacts: [ContactModel]) {
        self.contacts = contacts
    }
//    init(dict: NSDictionary) {
//        if let contactDict = dict["contacts"] as? NSArray{
//            for items in contactDict{
//                self.contacts.append(ContactModel.init(dict: items as! NSDictionary))
//            }
//        }
//    }
}

class ContactModel: Decodable {
    var name: String?
    var gender: String?
    
    init(dict : NSDictionary) {
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.gender = dict.value(forKey: "gender") as? String ?? ""
    }
}

