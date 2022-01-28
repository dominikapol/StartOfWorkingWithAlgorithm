//
//  Numbers.swift
//  HomeAssigmentGiniApps
//
//  Created by Dominika Poleshyck on 18.01.22.
//

import Foundation


struct Numbers {
    let number: [Int]
}

extension Numbers: Decodable {
    private enum Key: String, CodingKey {
        case number = "number"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.number = try container.decode([Int].self, forKey: .number)
      }
}



