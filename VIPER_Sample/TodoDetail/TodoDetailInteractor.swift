//
//  TodoDetailInteractor.swift
//  VIPER_Sample
//
//  Created by Ryosuke Sato on 2020/03/17.
//  Copyright © 2020 Ryosuke Sato. All rights reserved.
//

import Foundation

final class TodoDetailInteractor {
    
    weak var presenter: TodoDetailInteractorOutputProtocol?
}

extension TodoDetailInteractor: TodoDetailInteractorInputProtocol {
    
    func fetchTodo(_ todoId: Int) {
        let todo = TodoStore.shared.todos.filter { $0.id == todoId }.first ?? Todo.default
        self.presenter?.didFetchedTodo(todo)
    }
}
