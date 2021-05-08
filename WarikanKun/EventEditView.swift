//
//  EventEditView.swift
//  WarikanKun
//
//  Created by keiliving on 2021/04/08.
//

import SwiftUI

struct EventEditView: View {
    @State var isActiveSubView = false
    var body: some View {
        VStack{
            NavigationLink(destination: CreateMemberView(),isActive: $isActiveSubView) {
                EmptyView()}
            Button(action: {
                self.isActiveSubView.toggle()
            }) {
                Text("ユーザー追加")
            }.navigationBarBackButtonHidden(true)
            let total: Int = Member.getTotal()
            if let data = UserDefaults.standard.value(forKey:"member") as? Data {
               let optionalMemberArray = try? PropertyListDecoder().decode(Array<Member>.self, from: data)
                if let memberArray = optionalMemberArray{
                    List{
                            ForEach(0 ..< memberArray.count) { index in
                                NavigationLink(destination: EditMemberView(member:memberArray[index], arrayIndex:index)) {
                                    HStack{
                                        let payment:Int = calclatePayment(member:memberArray[index],count:memberArray.count,total:total)
                                        let showText: String = payment>=0 ?
                                            String(payment) + "円貰う" :
                                            String(payment * -1) + "円払う"
                                        Text(memberArray[index].name)
                                        Spacer()
                                        Text(showText)
                                    }
                                }
                            }
                    }
                }
            } else {}
        }
    }
    
    func calclatePayment (member:Member,count:Int,total:Int) -> Int {
        member.payment-total/count
    }
}


struct EventEditView_Previews: PreviewProvider {
    static var previews: some View {
        EventEditView()
    }
}
