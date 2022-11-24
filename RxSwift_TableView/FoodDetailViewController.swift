//
//  FoodDetailViewController.swift
//  RxSwift_TableView
//
//  Created by Uri on 24/11/22.
//

import Foundation
import UIKit

class FoodDetailViewController: ViewController {
    
    lazy var foodImageView: UIImageView = {
        let foodImageView = UIImageView()
        foodImageView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        foodImageView.contentMode = .scaleAspectFit
        return foodImageView
    }()
    
    var imageName: String = ""
    
    override func viewDidLoad() {
        foodImageView.image = UIImage(named: imageName)
    }
    
}
