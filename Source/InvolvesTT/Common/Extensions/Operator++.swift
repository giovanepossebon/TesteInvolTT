//
//  Operator++.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 23/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import Foundation

/// If `rhs` is not `nil`, assign it to `lhs`.
infix operator ??= : AssignmentPrecedence // { associativity right precedence 90 assignment } // matches other assignment operators

/// If `rhs` is not `nil`, assign it to `lhs`.
func ??=<T>(lhs: inout T?, rhs: T?) {
    guard let rhs = rhs else { return }
    lhs = rhs
}
