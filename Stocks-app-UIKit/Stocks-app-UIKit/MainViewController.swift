//
//  ViewController.swift
//  Stocks-app-UIKit
//
//  Created by Lado Tsivtsivadze on 11/10/21.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Main View Controller
    
    private var isScreenShown: Bool = false
    
    lazy var tableView: UITableView = {
        let x = view.bounds.width * 0.05
        let y = searchBar.frame.maxY + 20
        let width = view.bounds.width * 0.9
        let height = view.bounds.height - y
        let frame = CGRect(x: x, y: y, width: width, height: height)
        let tableView = UITableView(frame: frame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(StockCell.self, forCellReuseIdentifier: "StockCell")
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    lazy var searchBar: UISearchBar = {
        let x: CGFloat = view.bounds.width * 0.05
        let y: CGFloat = (navigationController?.navigationBar.frame.maxY)! + 20
        let width = view.bounds.width * 0.9
        let height: CGFloat = 50
        let frame = CGRect(x: x, y: y, width: width, height: height)
        let search = UISearchBar(frame: frame)
        search.barTintColor = .clear
        search.searchTextField.backgroundColor = .white
        return search
    }()
    
    // MARK: Article View
    
    lazy var articleView: UIView = {
        let vw = UIView(frame: articleInitialFrame)
        vw.backgroundColor = .white
        vw.layer.cornerRadius = 20
        vw.addGestureRecognizer(tapGesture)
        return vw
    }()
    
    lazy var articleInitialFrame: CGRect = {
        let x: CGFloat = 0
        let y: CGFloat = view.bounds.height
        let width = view.frame.width
        let height: CGFloat = 0
        let frame = CGRect(x: x, y: y, width: width, height: height)
        return frame
    }()
    
    lazy var smallArticleFrame: CGRect = {
        let x: CGFloat = 0
        let y: CGFloat = view.bounds.height * 0.9
        let width = view.frame.width
        let height = view.bounds.height * 1.3
        return CGRect(x: x, y: y, width: width, height: height)
    }()
    
    lazy var finalFrame: CGRect = {
        let x: CGFloat = 0
        let y: CGFloat = searchBar.frame.maxY + 20
        let width = view.frame.width
        let height = view.bounds.height * 1.3
        return CGRect(x: x, y: y, width: width, height: height)
    }()
    
    lazy var articleHeadline: UILabel = {
        let x: CGFloat = 20
        let y: CGFloat = -20
        let width = articleView.bounds.width * 0.5
        let height = articleView.bounds.height * 0.1
        let frame = CGRect(x: x, y: y, width: width, height: height)
        let label = UILabel(frame: frame)
        let font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.font = font
        label.text = "Top News"
        label.textAlignment = .left
        label.alpha = 0
        return label
    }()
    
    lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(sender:)))
        return tap
    }()

    let vm = StockListViewModel()
    
    // MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configVM()
    }
    
    private func setupUI() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(articleView)
        initialShowArticleScreen()
    }
    
    private func configVM() {
        vm.load(stockTableView: tableView)
    }
    
    private func initialShowArticleScreen() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.articleView.frame = self.smallArticleFrame
        } completion: { didFinish in
            if didFinish {
                // add subviews to article vie
                self.articleView.addSubview(self.articleHeadline)
                UIView.animate(withDuration: 0.5) {
                    self.articleHeadline.alpha = 1
                }
            }
        }
    }
    
    private func showScreen() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.articleView.frame = self.finalFrame
        } completion: { didFinish in
            if didFinish {
                // add extra subviews
                //self.articleView.addSubview(<#T##view: UIView##UIView#>)
            }
        }
    }
    
    private func hideArticleScreen() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.articleView.frame = self.smallArticleFrame
        } completion: { didFinish in
            if didFinish {
                // opacity of extra views = 0 and remove every subview
            }
        }
    }
    
    private func toggleScreen() {
        if isScreenShown {
            hideArticleScreen()
        }
        else {
            showScreen()
        }
        isScreenShown.toggle()
    }
    
    @objc func onTap(sender: UITapGestureRecognizer) {
        toggleScreen()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell") as? StockCell
        let vm = vm.vmForRowAt(index: indexPath.row)
        cell!.vm = vm
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.1
    }
}

