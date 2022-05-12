//
//  Action.swift
//  ResuableComponents
//
//  Created by Shravan Gudikadi on 11/27/21.
//

import Foundation

enum ActionType: String, CaseIterable {
    //
    case createMatch = "CREATE_MATCH"
    case joinTournament = "JOIN_TOURNAMENT"
    case createTeam = "CREATE_TEAM"
    case none
}

public class Action {
    //let actionType: ActionType
    let title: String
    let image: String
    public init(title: String, image: String) {
        self.title = title
        self.image = image
    }
    
    
//
//    var title: String {
//        switch actionType {
//        case .createMatch:
//            return "CREATE MATCH"
//        case .joinTournament:
//            return "JOIN TOURNAMANET"
//        case .createTeam:
//            return "CREATE TEAM"
//        default:
//            return ""
//        }
//    }
//
//    var image: String {
//        switch actionType {
//        case .createMatch:
//            return "gamepad"
//        case .joinTournament:
//            return "trophy"
//        case .createTeam:
//            return "users"
//        default:
//            return ""
//        }
//    }
}

protocol ActionViewModelProtocol {
    var title: String? { get }
    var imageName: String? { get }
   // var actionType: ActionType? { get}
    var tapEventHandler: (() -> Void)? { get }
}

struct ActionViewModel: ActionViewModelProtocol {
    var title: String?
    var imageName: String?
   // var actionType: ActionType?
    var tapEventHandler: (() -> Void)?
}
