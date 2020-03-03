//
//  ServiceView.swift
//  MVVMDemo
//
//  Created by Subhangi Pawar on 27/05/19.
//  Copyright © 2019 Subhangi Pawar. All rights reserved.
//

import UIKit

class ServiceView: NSObject {
    
    private var contactArray = [ContactModel]()
    private var jsonDict = NSDictionary()
    static let shareInstance = ServiceView()
    
    func getDataFromJson(completion: @escaping([ContactModel]?, Error?) -> Void) {
        let url = URL(string: "http://192.168.1.182:8080/examples/json/contacts.json")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                print(error?.localizedDescription ?? "")
                completion(nil, error)
            } else {
                if data != nil {
                    do{
                        let results = try JSONDecoder().decode(ResponseModel.self, from: data!)
                            print("result = \(results)")
                        for contact in results.contacts {
                            self.contactArray.append(contact)
                        }
                        completion(self.contactArray, error)
                    }catch let jsonErr {
                        print("json Error = \(jsonErr.localizedDescription)")
                    }
                }
            }
        }
        task.resume()
    }
}
