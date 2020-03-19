//
//  TodoDetailProtocol.swift
//  VIPER_Sample
//
//  Created by Ryosuke Sato on 2020/03/17.
//  Copyright © 2020 Ryosuke Sato. All rights reserved.
//

import UIKit

protocol TodoDetailViewProtocol: TransitionProtocol {
    
    var presenter: TodoDetailPresenterProtocol? { get set }
    
    func showTodo(_ todo: TodoDetailViewData)
}

protocol TodoDetailPresenterProtocol: class {
    
    var view: TodoDetailViewProtocol? { get set }
    var interactor: TodoDetailInteractorInputProtocol? { get set }
    var router: TodoDetailRouterProtocol? { get set }
    
    func viewWillAppear()
}

protocol TodoDetailInteractorInputProtocol: class {
    
    var presenter: TodoDetailInteractorOutputProtocol? { get set }
    
    func fetchTodo(_ todoId: Int)
}

protocol TodoDetailInteractorOutputProtocol: class {
    
    func didFetchedTodo(_ todo: Todo)
}

protocol TodoDetailRouterProtocol: class {
    
    static func assembleModules(_ todoId: Int) -> UIViewController
    
    var view: TodoDetailViewProtocol? { get set }
}
