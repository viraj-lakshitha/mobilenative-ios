//
//  Tutorial3.swift
//  LectureRecap-2
//
//  Created by Viraj Lakshitha Bandara on 2023-03-05.
//

import SwiftUI

struct Tutorial3: View {
    
    @State var playerInstance: PlayerList = PlayerList()

    var body: some View {
        HStack {
            NavigationView {
                List {
                    ForEach(playerInstance.playerList, id: \.id) { player in
                        NavigationLink(destination: PlayerView(details: player)) {
                            HStack {
                                Image(player.imageName)
                                    .resizable()
                                    .frame(width: 100.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(50)
                                Text(player.name)
                            }
                        }
                    }
                    .onDelete(perform: playerInstance.deletePlayer)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
                        } label: {
                            Text("Edit")
                        }
                    }
                }
                .padding()
                .navigationTitle("Players")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}


struct Tutorial3_Previews: PreviewProvider {
    static var previews: some View {
      Tutorial3()
    }
}

struct PlayerView: View {
    @State var details: Player
    
    var body: some View {
        VStack {
            HStack {
                Image(details.imageName)
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
                    .cornerRadius(50)
                
                Text(details.name)
                    .font(.headline)
                
                Text(details.bio)
                    .font(.title3)
                    .lineSpacing(10)
            }
            .padding()
            
            Image("epl")
                .resizable()
                .scaledToFit()
        }
        .navigationTitle(details.name)
    }
}
