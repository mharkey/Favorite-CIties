//
//  DetailViewController.swift
//  Favorite CIties
//
//  Created by Matthew Harkey on 1/29/19.
//  Copyright © 2019 Matthew Harkey. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var cityTesxtField: UITextField!
    @IBOutlet weak var statetextField: UITextField!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var detailItem: City? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let city = self.detailItem {
            if cityTesxtField != nil {
                cityTesxtField.text = city.name
                statetextField.text = city.state
                populationTextField.text = String(city.population)
                imageView.image = UIImage(data: city.image)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let city = self.detailItem {
            city.name = cityTesxtField.text!
            city.state = statetextField.text!
            city.population = Int(populationTextField.text!)!
        }
    }
}

