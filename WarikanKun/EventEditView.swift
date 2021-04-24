//
//  EventEditView.swift
//  WarikanKun
//
//  Created by keiliving on 2021/04/08.
//

import SwiftUI

struct EventEditView: View {
    @State var isActiveSubView = false
    @State private var eventName = ""
    var body: some View {
        VStack{
            TextField("イベント名", text: $eventName).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 270, height: 38)
                
                NavigationLink(destination: CreateMemberView(),isActive: $isActiveSubView) {
                    EmptyView()}
                Button(action: {
                    self.isActiveSubView.toggle()
                }) {
                    Text("ユーザー追加")
                }.navigationBarBackButtonHidden(true)
            
            if let data = UserDefaults.standard.value(forKey:"member") as? Data {
               let optionalMemberArray = try? PropertyListDecoder().decode(Array<Member>.self, from: data)
                if let memberArray = optionalMemberArray{
                    List{
                        ForEach(0 ..< memberArray.count) { index in
                            NavigationLink(destination: EditMemberView(member:memberArray[index], arrayIndex:index)) {
                            Text(memberArray[index].name)
                            }
                        }
                    }
                }
            } else {}
        }
}
}


struct EventEditView_Previews: PreviewProvider {
    static var previews: some View {
        EventEditView()
    }
}
