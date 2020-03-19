//
//  TodoListInteractor.swift
//  VIPER_Sample
//
//  Created by Ryosuke Sato on 2020/03/15.
//  Copyright © 2020 Ryosuke Sato. All rights reserved.
//

import Foundation

final class TodoListInteractor {
    
    weak var presenter: TodoListInteractorOutputProtocol?
}

extension TodoListInteractor: TodoListInteractorInputProtocol {
    
    func fetchTodos() {
        let todos = TodoStore.shared.todos
        self.presenter?.didFetchedTodos(todos)
    }
}
