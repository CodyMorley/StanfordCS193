//
//  Array+Only.swift
//  Memorize
//
//  Created by Cody Morley on 12/11/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
