//
//  FixedActionTileViewModel.swift
//  ResuableComponents
//
//  Created by Shravan Gudikadi on 11/27/21.
//

import Foundation

public class FixedActionTileViewModel {
    
    var subviewModels: [ActionViewModel]?
    var menuItems: [String]?
    var config: FixedActionTileView.Configuration?
    
    public init(title: String, image: String) {
        self.setupViewModels(title: title, image: image)
        
    }
    
    func setupViewModels(title: String, image: String) {
        
        self.subviewModels?.removeAll()
        self.subviewModels = [ActionViewModel]()
        self.subviewModels?.append(setupActionFor(title: title, image: image))
        self.config = FixedActionTileView.Configuration(subViewModels: subviewModels)
    }
    
    func setupActionFor(title:String, image: String) -> ActionViewModel {
        let action = Action(title: title, image: image)
        let eventHandler: () -> Void = { [weak self] in
            //self?.coordinateTo(actionType: actionType)
        }
        
        return ActionViewModel(title: action.title, imageName: action.image, tapEventHandler: eventHandler)
        
    }
    
//    func coordinateTo(actionType: ActionType) {
//        switch actionType {
//        case .createMatch:
//            guard let nav = Provider.navigationController else { return }
//            let coordinator = GamesCoordinator(nav)
//            coordinator.start()
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
