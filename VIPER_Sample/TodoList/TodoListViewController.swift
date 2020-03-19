//
//  TodoListViewController.swift
//  VIPER_Sample
//
//  Created by Ryosuke Sato on 2020/03/15.
//  Copyright © 2020 Ryosuke Sato. All rights reserved.
//

import UIKit

final class TodoListViewController: UIViewController {

    static func instantiate() -> TodoListViewController {
        let storyboard = UIStoryboard(name: "TodoList", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "TodoListViewController") as? TodoListViewController
        return view ?? TodoListViewController()
    }
    
    var presenter: TodoListPresenterProtocol?
    var viewDatas = [TodoListViewData]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter?.viewWillAppear()
    }
}

extension TodoListViewController: TodoListViewProtocol {
    
    func showTodos(_ todos: [TodoListViewData]) {
        self.viewDatas = todos
    }
}

extension TodoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell", for: indexPath) as? TodoListTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel?.text = self.viewDatas[indexPath.row].title
        return cell
    }
}

extension TodoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoId = self.viewDatas[indexPath.row].todoId
        self.presenter?.didSelectRow(todoId)
    }
}
