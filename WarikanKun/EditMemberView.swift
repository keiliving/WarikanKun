//
//  EditMemberView.swift
//  WarikanKun
//
//  Created by keiliving on 2021/04/18.
//

import SwiftUI


struct EditMemberView: View {
    @State var isActiveSubView = false
    @State var member: Member
    
    let arrayIndex: Int
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text("名前：")
                TextField("", text: $member.name).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 270, height: 38)
                Text(member.name)
            }
            HStack{
                Text("支払い：")
                TextField("", value: $member.payment, formatter: NumberFormatter())
                Text(String(member.payment))
            }
            Spacer()
            HStack{
                Spacer()
            NavigationLink(destination: EventEditView(),isActive: $isActiveSubView) {
                EmptyView()}
                Button(action: {
                    saveMember()
            }) {
                Text("OK")
            }
            Spacer()
            NavigationLink(destination: EventEditView(),isActive: $isActiveSubView) {
                EmptyView()}
                Button(action: {
                    deleteMember()
            }) {
                Text("削除")
            }
                Spacer()
            }
            Spacer()
        }
    }
    func saveMember () -> Void {
        self.isActiveSubView.toggle()
        if let data = UserDefaults.standard.value(forKey:"member") as? Data {
            let currentMemberArray: [Member]? = try? PropertyListDecoder().decode(Array<Member>.self, from: data)
            if var editMemberArray = currentMemberArray {
                editMemberArray[arrayIndex] = member
                UserDefaults.standard.set(try? PropertyListEncoder().encode(editMemberArray), forKey:"member")
                UserDefaults.standard.synchronize()}
            }
            else{}
    }
    
    func deleteMember () -> Void {
        self.isActiveSubView.toggle()
        if let data = UserDefaults.standard.value(forKey:"member") as? Data {
            let currentMemberArray: [Member]? = try? PropertyListDecoder().decode(Array<Member>.self, from: data)
            if var editMemberArray = currentMemberArray {
                editMemberArray.remove(at: arrayIndex)
                UserDefaults.standard.set(try? PropertyListEncoder().encode(editMemberArray), forKey:"member")
                UserDefaults.standard.synchronize()}
            }
            else{}
    }
}

struct EditMemberView_Previews: PreviewProvider {
    static var previews: some View {
        Text("aaa")
        //EditMemberView(member)
    }
}
