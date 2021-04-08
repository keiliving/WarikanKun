//
//  EventEditView.swift
//  WarikanKun
//
//  Created by keiliving on 2021/04/08.
//

import SwiftUI

struct EventEditView: View {
    @State private var eventName = ""
    var body: some View {
        VStack{
        TextField("イベント名", text: $eventName).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 270, height: 38)
        Button(action: {}){
            Text("new")
        }
            List{
                //todo 一般化
    NavigationLink(destination: SwiftUIView()) {
        HStack(spacing:100){
          Text("やまげん")
            VStack{
                Text("支払い:114514")
                Text("建て替え:810")
            }
        }
        
    }
        }
        }
    }
}

struct EventEditView_Previews: PreviewProvider {
    static var previews: some View {
        EventEditView()
    }
}
