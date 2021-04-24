//
//  EditMemberView.swift
//  WarikanKun
//
//  Created by keiliving on 2021/04/18.
//

import SwiftUI

struct EditMemberView: View {
    @State var isActiveSubView = false
    @State var member:Member
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text("名前：")
                TextField("", text: $member.name).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 270, height: 38)
            }
            Spacer()
            NavigationLink(destination: EventEditView(),isActive: $isActiveSubView) {
                EmptyView()}
                Button(action: {
                    saveMember()
            }) {
                Text("ユーザー追加")
            }
            Spacer()
        }
    }
    func saveMember () -> Void {
        //todo 先にmemberのindexを取得した方が良さそう
        self.isActiveSubView.toggle()
        let editMember = Member(name: member.name)
        if let data = UserDefaults.standard.value(forKey:"member") as? Data {
            let currentMemberArray: [Member]? = try? PropertyListDecoder().decode(Array<Member>.self, from: data)
            if var addMemberArray = currentMemberArray {
                addMemberArray.append(member)
                UserDefaults.standard.set(try? PropertyListEncoder().encode(addMemberArray), forKey:"member")
                UserDefaults.standard.synchronize()}
            }
            else{
                UserDefaults.standard.set(try? PropertyListEncoder().encode([member]), forKey:"member")
                UserDefaults.standard.synchronize()}
    }
}

struct EditMemberView_Previews: PreviewProvider {
    static var previews: some View {
        Text("aaa")
        //EditMemberView(member)
    }
}
