//
//  AddTaskViewController.swift
//  GoodList
//
//  Created by MAHIMA on 19/07/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func save(_ sender: Any) {
        guard let priority = Priority(rawValue: prioritySegment.selectedSegmentIndex), let title = taskTextField.text else {
            return
        }
        
    }
    
}
