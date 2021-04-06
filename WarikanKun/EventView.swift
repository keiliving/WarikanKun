//
//  EventView.swift
//  WarikanKun
//
//  Created by keiliving on 2021/04/06.
//

import SwiftUI

struct EventView: View {
    @State private var eventName = ""
    var body: some View {
        VStack{
            Text("イベント")
            TextField("イベント名", text: $eventName).frame(width: 300, height: 50).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            Text("aaaaaaaa")
            Spacer()
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
