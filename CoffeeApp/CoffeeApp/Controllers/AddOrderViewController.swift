//
//  AddOrderViewController.swift
//  CoffeeApp
//
//  Created by Lado Tsivtsivadze on 11/5/21.
//

import UIKit

protocol DataDelegateProtocol: AnyObject {
    func didFinish()
}


class AddOrderViewController: UIViewController {
    
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let vm = AddCoffeeOrderViewModel()
    private var segControl: UISegmentedControl!
    var delegate: DataDelegateProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        segControl = UISegmentedControl(items: vm.sizes)
        segControl.translatesAutoresizingMaskIntoConstraints = false
        segControl.contentVerticalAlignment = .center
        view.addSubview(segControl)
        
        NSLayoutConstraint.activate([
            segControl.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            segControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segControl.bottomAnchor.constraint(equalTo: txtField.topAnchor, constant: -20),
        ])
    }
    
    @IBAction func onCancel(_ sender: Any) {
        delegate.didFinish()
    }
    
    @IBAction func onSave(_ sender: Any) {
        vm.name = txtField.text
        vm.email = txtField2.text
        
        let stringType = vm.types[tableView.indexPathForSelectedRow!.row]
        let chosenType = CoffeeType.allCases.filter { $0.rawValue ==  stringType }[0]
        let stringSize = vm.sizes[segControl.selectedSegmentIndex]
        let chosenSize = CoffeeSize.allCases.filter { $0.rawValue == stringSize }[0]
        
        vm.orderType = chosenType
        vm.orderSize = chosenSize
        
        Webservice().load(resource: Order.createResource(vm)) { [weak self] result in
            switch result {
            case .success(let order):
                print(order)
                self?.delegate.didFinish()
            case .failure(let error):
                print(error)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddOrderViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addOrder")
        cell?.textLabel?.text = vm.types[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
