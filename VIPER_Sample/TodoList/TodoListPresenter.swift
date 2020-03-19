//
//  TodoListPresenter.swift
//  VIPER_Sample
//
//  Created by Ryosuke Sato on 2020/03/15.
//  Copyright © 2020 Ryosuke Sato. All rights reserved.
//

import Foundation

final class TodoListPresenter {
    
    weak var view: TodoListViewProtocol?
    var interactor: TodoListInteractorInputProtocol?
    var router: TodoListRouterProtocol?
}

extension TodoListPresenter: TodoListPresenterProtocol {
    
    func viewWillAppear() {
        self.interactor?.fetchTodos()
    }
    
    func didSelectRow(_ todoId: Int) {
        self.router?.transitionToDetailView(todoId)
    }
}

extension TodoListPresenter: TodoListInteractorOutputProtocol {
    
    func didFetchedTodos(_ todos: [Todo]) {
        var viewDatas = [TodoListViewData]()
        todos.forEach { todo in
            let viewData = TodoListViewData(todoId: todo.id, title: todo.title)
            viewDatas.append(viewData)
        }
        self.view?.showTodos(viewDatas)
    }
}
