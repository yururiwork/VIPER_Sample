//
//  TodoDetailViewController.swift
//  VIPER_Sample
//
//  Created by Ryosuke Sato on 2020/03/17.
//  Copyright © 2020 Ryosuke Sato. All rights reserved.
//

import UIKit

final class TodoDetailViewController: UIViewController {

    static func instantiate() -> TodoDetailViewController {
        let storyboard = UIStoryboard(name: "TodoDetail", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "TodoDetailViewController") as? TodoDetailViewController
        return view ?? TodoDetailViewController()
    }
    
    var presenter: TodoDetailPresenterProtocol?
    var viewData = TodoDetailViewData(todoId: 0, title: "", detail: "", isCompleted: false, deadLine: Date()) {
        didSet {
            self.titleLabel.text = self.viewData.title
            self.detailLabel.text = self.viewData.detail
            self.statusLabel.text = self.viewData.isCompleted ? "完了" : "未完了"
            self.deadLineLabel.text = self.viewData.deadLine.description
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var deadLineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter?.viewWillAppear()
    }
}

extension TodoDetailViewController: TodoDetailViewProtocol {
    
    func showTodo(_ todo: TodoDetailViewData) {
        self.viewData = todo
    }
}
