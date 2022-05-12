//
//  FixedActionTileViewModel.swift
//  ResuableComponents
//
//  Created by Shravan Gudikadi on 11/27/21.
//

import Foundation

class FixedActionTileViewModel {
    
    var subviewModels: [ActionViewModel]?
    var menuItems: [String]?
    var config: FixedActionTileView.Configuration?
    
    init() {
        self.setupViewModels()
        
    }
    
    func setupViewModels() {
        self.subviewModels?.removeAll()
        self.subviewModels = [ActionViewModel]()
       // self.subviewModels?.
//        self.subviewModels?.append(setupActionFor(actionType: .createMatch))
//        self.subviewModels?.append(setupActionFor(actionType: .joinTournament))
//        self.subviewModels?.append(setupActionFor(actionType: .createTeam))
        self.config = FixedActionTileView.Configuration(subViewModels: subviewModels)
    }
    
//    func setupActionFor(actionType: ActionType) -> ActionViewModel {
//
//        let action = Action(actionType: actionType)
//        let eventHandler: () -> Void = { [weak self] in
//            self?.coordinateTo(actionType: actionType)
//        }
//
//        return ActionViewModel(title: action.title, imageName: action.image, actionType: actionType, tapEventHandler: eventHandler)
//
//    }
    
//    func coordinateTo(actionType: ActionType) {
//        switch actionType {
//        case .createMatch:
//            return
//            //Routing
//        case .joinTournament:
//            return
//            //
//        case .createTeam:
//            return
//            //
//
//        default:
//            return
//        }
//    }
}
