//
//  ArticlesViewController.swift
//  Stocks-app-UIKit
//
//  Created by Lado Tsivtsivadze on 11/11/21.
//

import UIKit

class ArticlesViewController: UIViewController {
        
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: view.bounds.width,
                                        height: view.bounds.height * 1.6)
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    lazy var articleView: UIView = {
        let x: CGFloat = 0
        let y: CGFloat = view.bounds.height
        let width = scrollView.frame.width
        let height: CGFloat = 0
        let frame = CGRect(x: x, y: y, width: width, height: height)
        let vw = UIView(frame: frame)
        vw.backgroundColor = .white
        vw.layer.cornerRadius = 20
        return vw
    }()
    
    lazy var articleFinalFrame: CGRect = {
        let x: CGFloat = 0
        let y: CGFloat = view.bounds.height * 0.8
        let width = scrollView.frame.width
        let height = view.bounds.height * 1.3
        return CGRect(x: x, y: y, width: width, height: height)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.addSubview(scrollView)
        scrollView.addSubview(articleView)
        showArticleScreen()
        
    }
    
    private func showArticleScreen() {
        UIView.animate(withDuration: 1) { [weak self] in
            guard let self = self else { return }
            self.articleView.frame = self.articleFinalFrame
        }
    }
}
