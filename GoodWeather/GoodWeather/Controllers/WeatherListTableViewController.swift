//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Lado Tsivtsivadze on 11/15/21.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
    
    var weatherListVM: WeatherListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherListVM = WeatherListViewModel(tableView: tableView)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "plusIdentifier" {
            let vc = (segue.destination as! UINavigationController).topViewController as? AddWeatherCityViewController
            vc!.delegate = weatherListVM
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherListVM.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell
        
        let vm = weatherListVM.vmForRowAt(index: indexPath.row)
        
        cell!.cityNameLabel.text = vm.name
        cell!.temperatureLabel.text = "\(vm.temperature)°"
        // Configure the cell...

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
