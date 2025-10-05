//
//  tabBarViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 04/10/25.
//

import UIKit

class tabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            setupTabBar()
    }
        
    func setupTabBar() {
        tabBar.items?[0].title = "item.one".localized
        tabBar.items?[1].title = "item.two".localized
        tabBar.items?[2].title = "item.three".localized
        tabBar.items?[3].title = "item.four".localized
        
        tabBar.items?[0].image = UIImage(systemName: "house.fill")
        tabBar.items?[1].image = UIImage(systemName: "tablecells.badge.ellipsis.fill")
        tabBar.items?[2].image = UIImage(systemName: "chart.bar.xaxis")
        tabBar.items?[3].image = UIImage(systemName: "chart.line.text.clipboard.fill")
    
        tabBar.tintColor = UIColor.darkestGreen
        tabBar.unselectedItemTintColor = UIColor.clLightGreen
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
