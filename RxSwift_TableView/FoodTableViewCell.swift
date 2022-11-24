//
//  FoodTableViewCell.swift
//  RxSwift_TableView
//
//  Created by Uri on 24/11/22.
//

import Foundation
import UIKit


class FoodTableViewCell: UITableViewCell {
    
    lazy var foodImageView: UIImageView = {
        let foodImageView = UIImageView()
        foodImageView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        foodImageView.contentMode = .scaleAspectFit
        return foodImageView
    }()
    
    lazy var foodLabel: UILabel = {
        let foodLabel = UILabel()
        foodLabel.text = ""
        foodLabel.textColor = UIColor.systemBlue
        return foodLabel
    }()
}
