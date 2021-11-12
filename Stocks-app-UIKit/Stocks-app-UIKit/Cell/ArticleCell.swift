//
//  ArticleCell.swift
//  Stocks-app-UIKit
//
//  Created by Lado Tsivtsivadze on 11/12/21.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    var vm: ArticleViewModel?
    
    var cellWidth: CGFloat {
        bounds.width
    }
    
    var cellHeight: CGFloat {
        bounds.height
    }
    
    let textColor: UIColor = .white
    
    lazy var arial = {
        UIFont(name: "Arial", size: cellHeight * 0.17)
    }()
    
    lazy var titleLabel: UILabel = {
        let x = cellWidth * 0.05
        let y = cellHeight * 0.05
        let width = cellWidth * 0.5
        let height = cellHeight * 0.4
        let frame = CGRect(x: x, y: y, width: width, height: height)
        let title = UILabel(frame: frame)
        title.text = "Title"
        title.font = arial
        title.textAlignment = .left
        title.textColor = textColor
        title.numberOfLines = 2
        return title
    }()
    
    lazy var subtitleLabel: UILabel = {
        let x = titleLabel.frame.minX
        let y = cellHeight * 0.55
        let width = titleLabel.frame.width
        let height = cellHeight * 0.4
        let frame = CGRect(x: x, y: y, width: width, height: height)
        let subtitle = UILabel(frame: frame)
        subtitle.text = "Subtitle"
        subtitle.font = UIFont(name: "Arial", size: cellHeight * 0.12)
        subtitle.textAlignment = .left
        subtitle.textColor = textColor
        subtitle.numberOfLines = 2
        return subtitle
    }()
    
    lazy var imgView: UIImageView = {
        let x = titleLabel.frame.maxX + 10
        let y = titleLabel.frame.minY
        let width = cellWidth - x - (cellWidth * 0.1)
        let height = cellHeight * 0.9
        let frame = CGRect(x: x, y: y, width: width, height: height)
        let imageView = UIImageView(frame: frame)
        //let defaultImage = UIImage(systemName: "xmark.app")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        config()
    }
    
    private func setupUI() {
        backgroundColor = .clear
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(imgView)
    }
    
    func config() {
        guard let vm = vm else { return }
        titleLabel.text = vm.title
        subtitleLabel.text = vm.publication
        imgView.image = vm.img
    }
}
