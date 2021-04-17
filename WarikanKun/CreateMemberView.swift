//
//  CreateMemberView.swift
//  WarikanKun
//
//  Created by keiliving on 2021/04/10.
//

import SwiftUI

struct CreateMemberView: View {
    @State var isActiveSubView = false
    @State private var name = ""
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text("名前：")
                TextField("名前を入力してください", text: $name).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 270, height: 38)
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
        self.isActiveSubView.toggle()
        let member = Member(name:name)
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


struct CreateMemberView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMemberView()
    }
}
