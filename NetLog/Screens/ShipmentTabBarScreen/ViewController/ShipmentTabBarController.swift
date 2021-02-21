//
//  ShipmentTabBarController.swift
//  NetLog
//
//  Created by ENES AKSOY on 20.02.2021.
//

import UIKit

class ShipmentTabBarController: UITabBarController {
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabBarItems()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame = CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: tabBar.frame.size.height)
    }
    
    // MARK: - TabBar Configure
    
    private func setTabBarItems() {
        
        let shipmentDetailVC: ShipmentDetailScreenViewController = ShipmentDetailScreenViewController(nibName: "ShipmentDetailScreenViewController", bundle: nil)
        let emptyTabOneVC: EmptyTabScreenOneViewController = EmptyTabScreenOneViewController(nibName: "EmptyTabScreenOneViewController", bundle: nil)
        emptyTabOneVC.view.frame = CGRect(x: 0, y: 100, width: emptyTabOneVC.view.frame.width, height: emptyTabOneVC.view.frame.height)
        let emptyTabTwoVC: EmptyTabScreenTwoViewController = EmptyTabScreenTwoViewController(nibName: "EmptyTabScreenTwoViewController", bundle: nil)
        let emptyTabThreeVC: EmptyTabScreenThreeViewController = EmptyTabScreenThreeViewController(nibName: "EmptyTabScreenThreeViewController", bundle: nil)
        let emptyTabFourVC: EmptyTabScreenFourViewController = EmptyTabScreenFourViewController(nibName: "EmptyTabScreenFourViewController", bundle: nil)
        
        self.viewControllers = [emptyTabOneVC, shipmentDetailVC, emptyTabTwoVC, emptyTabThreeVC, emptyTabFourVC]
        
        let emptyTabOneVCItem = UITabBarItem(title: "", image: UIImage(named: "infoIcon"), tag: 0)
        let shipmentDetailVCItem = UITabBarItem(title: "", image: UIImage(named: "upArrowIcon"), tag: 1)
        let emptyTabTwoVCItem = UITabBarItem(title: "", image: UIImage(named: "postIcon"), tag: 2)
        let emptyTabThreeVCItem = UITabBarItem(title: "", image: UIImage(named: "downArrowIcon"), tag: 3)
        let emptyTabFourVCItem = UITabBarItem(title: "", image: UIImage(named: "calendarIcon"), tag: 4)
        
        shipmentDetailVC.tabBarItem = shipmentDetailVCItem
        emptyTabOneVC.tabBarItem = emptyTabOneVCItem
        emptyTabTwoVC.tabBarItem = emptyTabTwoVCItem
        emptyTabThreeVC.tabBarItem = emptyTabThreeVCItem
        emptyTabFourVC.tabBarItem = emptyTabFourVCItem
    }
}
