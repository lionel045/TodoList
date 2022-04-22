//
//  ItemModel.swift
//  TodoList
//
//  Created by Lion on 19/03/2022.
//

import Foundation

struct ItemModel: Identifiable,Codable{ // création d'une structure
    let id: String
    let title: String
    let isCompleted: Bool

    init(id: String = UUID().uuidString,title: String, isCompleted: Bool)
    {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        
        
    }
    func updateCompletion() -> ItemModel {
    
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
}
}
