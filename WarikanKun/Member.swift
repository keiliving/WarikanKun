//
//  Member.swift
//  WarikanKun
//
//  Created by keiliving on 2021/04/06.
//

import Foundation

struct Member: Codable {
    var name: String = ""
    var payment: [Int] = []
    var debt: [Int] = []
    var expenses: Int = 0
    
    mutating func updateExpenses() -> Void {
        let sumPayment: Int = payment.reduce(0) {(num1: Int, num2: Int) -> Int in
            return num1 + num2
        }
        let sumDebt: Int = debt.reduce(0) {(num1: Int, num2: Int) -> Int in
            return num1 + num2
        }
        self.expenses = sumPayment + sumDebt
    }
}
