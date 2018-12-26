//
//  ContractItem.swift
//  DynamicForm
//
//  Created by Artem Miklashevich on 12/24/18.
//  Copyright © 2018 Artem Miklashevych. All rights reserved.
//

import Foundation

struct Contract: Codable {
    struct Items: Codable {
        struct Item: Codable {
            var id: Int
            var title: String
            var value: String
            var type: String
        }
        let item: [Item]
    }
    var title: String
    var number: Int
    var items: Items
}
