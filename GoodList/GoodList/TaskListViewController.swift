//
//  TaskListViewController.swift
//  GoodList
//
//  Created by MAHIMA on 19/07/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TaskListViewController: UIViewController {
    
    //MARK:- Properties
    
    private var tasks = BehaviorRelay<[Task]>(value: [])
    private var filteredTask = [Task]()
    var disposeBag = DisposeBag()
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    //MARK:- LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navVC = segue.destination as? UINavigationController, let addTaskVC = navVC.viewControllers.first as? AddTaskViewController else {return}
        addTaskVC.taskSubjectObservable.subscribe(onNext: {[weak self] task in
            guard var existingTasks = self?.tasks.value else {return}
            existingTasks.append(task)
            self?.tasks.accept(existingTasks)
            self?.filterTask()
        }).disposed(by: disposeBag)
        
    }

    @IBAction func priorityChanged(_ sender: Any) {
        filterTask()
    }
    private func filterTask() {
        filteredTask = tasks.value
        guard let selectedPriority = Priority(rawValue: prioritySegment.selectedSegmentIndex - 1) else {
            taskTableView.reloadData()
            return
        }
        self.tasks.map { task in
            return task.filter{$0.priority == selectedPriority}
        }.subscribe(onNext: { [weak self] tasks in
            self?.filteredTask = tasks
            self?.taskTableView.reloadData()
            }).disposed(by: disposeBag)
        
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.filteredTask[indexPath.row].title
        return cell
    }
    
    
}
