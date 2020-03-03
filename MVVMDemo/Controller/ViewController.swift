//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Subhangi Pawar on 27/05/19.
//  Copyright © 2019 Subhangi Pawar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var contactArray = [ContactViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    fileprivate func loadData(){
        ServiceView.shareInstance.getDataFromJson { (contacts, error) in
            if error == nil {
                print(contacts!)
                self.contactArray = contacts?.map( { return ContactViewModel(detail: $0) }) ?? []
                DispatchQueue.main.async {
                     self.tableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contactArray[indexPath.row].name
        cell.detailTextLabel?.text = contactArray[indexPath.row].gender
        return cell
    }
}
