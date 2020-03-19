//
//  TodoListProtocol.swift
//  VIPER_Sample
//
//  Created by Ryosuke Sato on 2020/03/15.
//  Copyright © 2020 Ryosuke Sato. All rights reserved.
//

import UIKit

protocol TodoListViewProtocol: TransitionProtocol {
    
    var presenter: TodoListPresenterProtocol? { get set }
    
    func showTodos(_ todos: [TodoListViewData])
}

protocol TodoListPresenterProtocol: class {
    
    var view: TodoListViewProtocol? { get set }
    var interactor: TodoListInteractorInputProtocol? { get set }
    var router: TodoListRouterProtocol? { get set }
    
    func viewWillAppear()
    func didSelectRow(_ todoId: Int)
}

protocol TodoListInteractorInputProtocol: class {
    
    var presenter: TodoListInteractorOutputProtocol? { get set }
    
    func fetchTodos()
}

protocol TodoListInteractorOutputProtocol: class {
    
    func didFetchedTodos(_ todos: [Todo])
}

protocol TodoListRouterProtocol: class {
    
    static func assembleModules() -> UIViewController
    
    var view: TodoListViewProtocol? { get set }
    
    func transitionToDetailView(_ todoId: Int)
}
