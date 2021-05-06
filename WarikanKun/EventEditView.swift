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
        
        if let data = UserDefaults.standard.value(forKey:"member") as? Data {
           let optionalMemberArray = try? PropertyListDecoder().decode(Array<Member>.self, from: data)
            if let memberArray = optionalMemberArray{
                List{
                        ForEach(0 ..< memberArray.count) { index in
                        NavigationLink(destination: EditMemberView(member:memberArray[index], arrayIndex:index)) {
                            HStack{
                                            Text(memberArray[index].name)
                                            Text(String(memberArray[index].expenses))
                                            }
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
