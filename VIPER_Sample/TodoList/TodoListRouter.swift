//
//  TodoListRouter.swift
//  VIPER_Sample
//
//  Created by Ryosuke Sato on 2020/03/15.
//  Copyright © 2020 Ryosuke Sato. All rights reserved.
//

import UIKit

final class TodoListRouter {
    
    weak var view: TodoListViewProtocol?
}

extension TodoListRouter: TodoListRouterProtocol {
    
    static func assembleModules() -> UIViewController {
        
        let view = TodoListViewController.instantiate()
        let presenter = TodoListPresenter()
        let interactor = TodoListInteractor()
        let router = TodoListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
    func transitionToDetailView(_ todoId: Int) {
        let detailView = TodoDetailRouter.assembleModules(todoId)
        self.view?.pushViewController(detailView, animated: true)
    }
}
