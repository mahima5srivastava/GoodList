//
//  TaskListViewController.swift
//  GoodList
//
//  Created by MAHIMA on 19/07/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    //MARK:- LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "to do item"
        return cell
    }
    
    
}
