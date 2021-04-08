//
//  ContentView.swift
//  WarikanKun
//
//  Created by keiliving on 2021/04/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            //Text("aaa")
            VStack{
                    List{
            NavigationLink(destination: EventEditView()) {
                  Text("新規作成")}
                }
                    .navigationTitle("割り勘くん")
        }
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
