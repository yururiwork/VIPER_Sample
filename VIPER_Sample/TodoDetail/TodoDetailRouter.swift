//
//  TodoDetailRouter.swift
//  VIPER_Sample
//
//  Created by Ryosuke Sato on 2020/03/17.
//  Copyright © 2020 Ryosuke Sato. All rights reserved.
//

import UIKit

final class TodoDetailRouter {
    
    weak var view: TodoDetailViewProtocol?
}

extension TodoDetailRouter: TodoDetailRouterProtocol {
    
    static func assembleModules(_ todoId: Int) -> UIViewController {
        
        let view = TodoDetailViewController.instantiate()
        let presenter = TodoDetailPresenter()
        let interactor = TodoDetailInteractor()
        let router = TodoDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        presenter.todoId = todoId
        
        return view
    }
}
