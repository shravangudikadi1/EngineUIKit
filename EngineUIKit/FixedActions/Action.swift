//
//  Action.swift
//  ResuableComponents
//
//  Created by Shravan Gudikadi on 11/27/21.
//

import Foundation

//enum ActionType: String, CaseIterable {
//
//    //
//    case createMatch = "CREATE_MATCH"
//    case joinTournament = "JOIN_TOURNAMENT"
//    case createTeam = "CREATE_TEAM"
//    case none
//}

class Action {
    
    let title: String
    let image: String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
    

}

protocol ActionViewModelProtocol {
    var title: String? { get }
    var imageName: String? { get }
    var tapEventHandler: (() -> Void)? { get }
    
}

struct ActionViewModel: ActionViewModelProtocol {
    var title: String?
    
    var imageName: String?
    var tapEventHandler: (() -> Void)?
    
    
}
