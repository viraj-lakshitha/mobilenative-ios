//
//  Tutorial3_Utils.swift
//  LectureRecap-2
//
//  Created by Viraj Lakshitha Bandara on 2023-03-05.
//

import Foundation

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var bio: String
}

class PlayerList: ObservableObject {
    @Published var playerList: [Player] = []
    
    init() {
        playerList.append(contentsOf: [
            Player(name: "John Terry", imageName: "jt", bio: "Career:\n" +
                       "• Main Club - Chelsea  \n" +
                       "• Position - Centre-back\n " +
                       "• England Caps - 58\n"),
            Player(name: "Cristiano Ronaldo", imageName: "ronaldo", bio: "Career:\n" +
                       "• Main Club - Man Utd, Real Madrid  \n" +
                       "• Position - Striker\n " +
                       "• Portugal Caps - 132\n"),
            Player(name: "Paul Scoles", imageName: "scholes", bio: "Career:\n" +
                       "• Main Club - Man Utd  \n" +
                       "• Position - Cetral midfield\n " +
                       "• England Caps - 66\n"),
            Player(name: "Rio Ferdinand", imageName: "rio", bio: "Career:\n" +
                       "• Main Clubs - West Ham, Leeds Utd, Man Utd  \n" +
                       "• Position - Centre-back\n " +
                       "• England Caps - 81\n" ),
            Player(name: "Thiery Henry", imageName: "henry", bio: "Career:\n" +
                       "• Main Clubs - Monaco, Arsenal, Barcelona  \n" +
                       "• Position - Stiker\n " +
                       "• France Caps - 123\n"),
            Player(name: "Ryan Giggs", imageName: "giggs", bio: "Career:\n" +
                       "• Main Club - Man Utd \n" +
                       "• Position - Winger\n " +
                       "• Wales Caps - 64\n"),
            Player(name: "Gary Neville", imageName: "gary", bio: "Career:\n" +
                       "• Main Club - Man Utd  \n" +
                       "• Position - Right-back\n " +
                       "• England Caps - 85\n"),
            Player(name: "Ashley Cole", imageName: "ashley", bio: "Career:\n" +
                       "• Main Clubs - Arsenal, Chelsea  \n" +
                       "• Position - Left-back\n " +
                       "• England Caps - 107\n"),
            Player(name: "Peter Scmichael", imageName: "peter", bio: "Career:\n" +
                       "• Main Club - Man Utd  \n" +
                       "• Position - Goalkeeper \n " +
                       "• Denmark Caps - 129\n")
        ])
    }
    
    public func addPlayer(newPlayer: Player) {
        playerList.append(newPlayer)
    }
    
    public func deletePlayer(at indexSet: IndexSet) {
        playerList.remove(atOffsets: indexSet)
    }
    
    public func getPlayers() -> [Player] {
        return playerList
    }
}
