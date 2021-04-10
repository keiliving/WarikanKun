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
            NavigationLink(destination: CreateMemberView(),isActive: $isActiveSubView) {
                EmptyView()}
                Button(action: {
                    self.isActiveSubView.toggle()
            }) {
                Text("ユーザー追加")
            }
            Spacer()
        }
    }
}


struct CreateMemberView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMemberView()
    }
}
