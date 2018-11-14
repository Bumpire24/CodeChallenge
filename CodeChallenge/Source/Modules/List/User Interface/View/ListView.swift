//
//  ListView.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import UIKit

class ListView: UIViewController, ListViewProtocol, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var listView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var eventHandler: ListModuleProtocol?
    private var itemList: [Place]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        eventHandler?.fetchList()
    }
    
    func displayList(_ places: [Place]) {
        itemList = places
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let itemList = itemList {
            return itemList.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ListTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if let itemList = itemList {
            cell.textLabel?.text = itemList[indexPath.row].name
            cell.detailTextLabel?.text = "\(itemList[indexPath.row].distance)m"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventHandler?.goToDetail(atIndex: indexPath.row)
    }
}
