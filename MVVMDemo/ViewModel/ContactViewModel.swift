//
//  ContactViewModel.swift
//  MVVMDemo
//
//  Created by Subhangi Pawar on 27/05/19.
//  Copyright © 2019 Subhangi Pawar. All rights reserved.
//

import UIKit

class ContactViewModel: NSObject {
    var name: String?
    var gender: String?
    
    init(detail: ContactModel) {
        self.name = detail.name
        self.gender = detail.gender
    }
}
