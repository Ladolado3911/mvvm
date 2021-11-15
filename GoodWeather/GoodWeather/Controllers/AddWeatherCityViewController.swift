//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Lado Tsivtsivadze on 11/15/21.
//

import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSave(sender: UIButton) {
        if let city = textField.text {
            let url = URL(string: Endpoints.getWeatherString(city: city))!
            let weatherResource = Resource<Any>(url: url) { data in
                return data
            }
            Webservice().load(resource: weatherResource) { result in
                print(result)
            }
        }
        //dismiss(animated: true)
    }
    
    @IBAction func onCancel(sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
