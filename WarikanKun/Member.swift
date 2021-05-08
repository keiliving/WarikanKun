//
//  Member.swift
//  WarikanKun
//
//  Created by keiliving on 2021/04/06.
//

import Foundation

struct Member: Codable {
    
    var name: String = ""
    var payment: Int = 0
    var debt: Int = 0
    var expenses: Int = 0
    static func getTotal() -> Int{
        var totalPayment: Int = 0
        if let data = UserDefaults.standard.value(forKey:"member") as? Data {
            let MemberArray: [Member]? = try? PropertyListDecoder().decode(Array<Member>.self, from: data)
            if let unwrapedMemberArray = MemberArray {
                for index in 0 ..< unwrapedMemberArray.count {
                    totalPayment = totalPayment + unwrapedMemberArray[index].payment
                }
            }
        else{}
        }
        return totalPayment
    }
}
