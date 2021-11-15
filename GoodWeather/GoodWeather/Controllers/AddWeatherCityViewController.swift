//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Lado Tsivtsivadze on 11/15/21.
//

import UIKit

protocol DataSendingProtocol: AnyObject {
    func appendDataBack(weatherViewModel: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var delegate: DataSendingProtocol!
    private var addWeatherVM = AddWeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSave(sender: UIButton) {
        guard let delegate = delegate else { return }
        if let city = textField.text {
            addWeatherVM.addWeather(city: city) { weather in
                self.delegate?.appendDataBack(weatherViewModel: weather)
                self.dismiss(animated: true)
            }
        }
        //dismiss(animated: true)
    }
    
    @IBAction func onCancel(sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
