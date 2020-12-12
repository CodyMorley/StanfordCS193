//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Cody Morley on 12/11/20.
//

import Foundation

import Foundation

extension Array where Element: Identifiable {
    func firstIndexMatching(matching element: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == element.id {
                return index
            }
        }
        return nil
    }
}
