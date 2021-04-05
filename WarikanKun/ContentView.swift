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
                    List{
            NavigationLink(destination: SwiftUIView()) {
                  Text("新規作成")}
            NavigationLink(destination: SwiftView()) {
                            Text("編集")
                        }
                }
                    .navigationTitle("割り勘くん")
        }
    
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
