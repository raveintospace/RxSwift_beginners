//
//  ViewController.swift
//  RxSwift_TableView
//
//  Created by Uri on 24/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    // let tableViewItems = Observable.just(["Item 1", "Item 2", "Item 3", "Item 4"])  // just = the observable will emit only the referenced elements
    
    let tableViewItems = Observable.just([Food(name: "Hamburger", image: "hamburger"),
                                          Food(name: "Pizza", image: "pizza"),
                                          Food(name: "Salmon", image: "salmon"),
                                          Food(name: "Pasta", image: "pasta")
    ])
    
    let disposeBag = DisposeBag()       // takes care of the memory management
    
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
        bind()
    }
    
    private func bind() {   // to bind the observables with our tableView
        tableViewItems.bind(to: tableView
            .rx.items(cellIdentifier: "Cell", cellType: FoodTableViewCell.self)) {
                (tv, tableViewItem, cell) in
                cell.foodLabel.text = tableViewItem.name
                cell.foodImageView.image = UIImage(named: tableViewItem.image)
            }
            .disposed(by: disposeBag)
        
        tableView
            .rx.modelSelected(Food.self)
            .subscribe(onNext: {
                foodObject in
                let vc = FoodDetailViewController()
                vc.imageName = foodObject.image
                self.present(vc, animated: true)
            })
            .disposed(by: disposeBag)
        
        // to work with indexPath instead of modelSelected
//        tableView
//            .rx.itemSelected
//            .subscribe(onNext: {
//                indexPath in
//            })
//            .disposed(by: disposeBag)
    }
}
