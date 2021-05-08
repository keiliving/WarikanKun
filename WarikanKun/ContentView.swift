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
                    
            NavigationLink(destination: EventEditView()) {
                  Text("新規作成")}
                List{
                    //todo 既存のeventのcollection
                }
                    .navigationTitle("割る男")
        }
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
