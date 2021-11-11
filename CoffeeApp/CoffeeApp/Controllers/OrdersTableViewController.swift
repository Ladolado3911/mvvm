//
//  OrdersTableViewController.swift
//  CoffeeApp
//
//  Created by Lado Tsivtsivadze on 11/5/21.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    let viewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            return
        }
        let resource = Resource<[Order]>(url: url)
        Webservice().load(resource: resource) { [weak self] result in
            switch result {
            case .success(let orders):
                self?.viewModel.orders = orders.map { OrderViewModel(order: $0) }
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = (segue.destination as? UINavigationController)?.viewControllers[0] as? AddOrderViewController
        //segue.destinatio
        
        vc?.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.orders.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)

        // Configure the cell...
        let vm = viewModel.orderViewModel(at: indexPath.row)
        
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension OrdersTableViewController: DataDelegateProtocol {
    func didFinish() {
        dismiss(animated: true) { [weak self] in
            guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
                return
            }
            let resource = Resource<[Order]>(url: url)
            Webservice().load(resource: resource) { [weak self] result in
                switch result {
                case .success(let orders):
                    self?.viewModel.orders = orders.map { OrderViewModel(order: $0) }
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
