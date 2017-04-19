//
//  MainController.swift
//  AlertTransition
//
//  Created by 韩帅 on 2017/4/18.
//  Copyright © 2017年 Loopeer. All rights reserved.
//

import UIKit
import AlertTransition

class MainController: UITableViewController {
    
    var titles = ["EasyTransition", "EasyTransition use in Storyboard", "Different Alert Implementation", "Menu Transition", "TrolleyTransition"]
    var menuController = MenuController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AlertTransition"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        tableView.tableFooterView = UIView()
        
        let transition = MenuTransition(from: navigationController)
        menuController.at.transition = transition
    }
}

extension MainController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(EasyTransitionController(), animated: true)
        case 1:
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let storyboardController = storyBoard.instantiateViewController(withIdentifier: "EasyStoryboardController") as UIViewController
            navigationController?.pushViewController(storyboardController, animated: true)
        case 2:
            navigationController?.pushViewController(DifferentAlertController(), animated: true)
        case 3:
            navigationController?.present(menuController, animated: true, completion: nil)
        case 4:
            let trolleyController = TrolleyController()
            trolleyController.at.transition = TrolleyTransition()
            present(trolleyController, animated: true, completion: nil)
        default:
            break
        }
    }
}
