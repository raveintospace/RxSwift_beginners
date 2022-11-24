//
//  ViewController.swift
//  RxSwift_TableView
//
//  Created by Uri on 24/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let tableViewItems = ["Item 1", "Item 2", "Item 3", "Item 4"]

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
// MARK: - Funcs
    
    private func setup() {
        view.addSubview(tableView)
    }

}

