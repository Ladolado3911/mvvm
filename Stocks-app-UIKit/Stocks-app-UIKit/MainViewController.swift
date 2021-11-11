//
//  ViewController.swift
//  Stocks-app-UIKit
//
//  Created by Lado Tsivtsivadze on 11/10/21.
//

import UIKit

class MainViewController: UIViewController {
    
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
    
    let vm = StockListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configVM()
    }
    
    private func setupUI() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    private func configVM() {
        vm.load(for: tableView)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell") as? StockCell
        let vm = vm.vmForRowAt(index: indexPath.row)
        cell!.config(with: vm)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.1
    }
}

