//
//  StockCell.swift
//  Stocks-app-UIKit
//
//  Created by Lado Tsivtsivadze on 11/10/21.
//

import UIKit

class StockCell: UITableViewCell {
    
    var cellWidth: CGFloat {
        contentView.bounds.width
    }
    
    var cellHeight: CGFloat {
        contentView.bounds.height
    }
    
    lazy var arial = {
        UIFont(name: "Arial", size: cellHeight * 0.20)
    }()
    
    let textAlignment: NSTextAlignment = .left
    let textColor: UIColor = .white
    
    
    lazy var titleLabel: UILabel = {
        let x = cellWidth * 0.05
        let y = cellHeight * 0.05
        let width = cellWidth * 0.4
        let height = cellHeight * 0.4
        let frame = CGRect(x: x, y: y, width: width, height: height)
        let title = UILabel(frame: frame)
        //title.text = "Title"
        title.font = arial
        title.font = title.font?.withSize(cellHeight * 0.2)
//        title.backgroundColor = .red
        title.textColor = textColor
        title.textAlignment = textAlignment
        return title
    }()
    
    lazy var subtitleLabel: UILabel = {
        let x = titleLabel.frame.minX
        let y = cellHeight * 0.55
        let width = titleLabel.frame.width
        let height = cellHeight * 0.4
        let frame = CGRect(x: x, y: y, width: width, height: height)
        let subtitle = UILabel(frame: frame)
        //subtitle.text = "Subtitle"
        subtitle.font = UIFont(name: "Arial", size: cellHeight * 0.15)
        subtitle.textColor = .gray
//        subtitle.backgroundColor = .red
        subtitle.textAlignment = textAlignment
        return subtitle
    }()
    
    lazy var priceLabel: UILabel = {
        let x = cellWidth * 0.55
        let y = titleLabel.frame.minY
        let width = titleLabel.frame.width
        let height = titleLabel.frame.height
        let frame = CGRect(x: x, y: y, width: width, height: height)
        let price = UILabel(frame: frame)
        //price.text = "Price"
        price.font = arial
        price.textColor = textColor
//        price.backgroundColor = .red
        price.textAlignment = .right
        return price
    }()
    
    lazy var changeLabel: UILabel = {
        let x = cellWidth * 0.75
        let y = subtitleLabel.frame.minY
        let width = cellWidth * 0.2
        let height = priceLabel.frame.height
        let frame = CGRect(x: x, y: y, width: width, height: height)
        let change = UILabel(frame: frame)
        change.layer.masksToBounds = true
        change.layer.cornerRadius = 10
        //change.text = "Change"
        change.font = UIFont(name: "Arial", size: cellHeight * 0.15)
        
        change.textColor = textColor
        change.backgroundColor = .red
        change.textAlignment = .center
        return change
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .clear
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(priceLabel)
        addSubview(changeLabel)
    }
    
    func config(with model: StockViewModel) {
        titleLabel.text = model.symbol
        subtitleLabel.text = model.description
        priceLabel.text = model.price
        changeLabel.text = model.change
    }
}
