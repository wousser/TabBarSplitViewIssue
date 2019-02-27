//
//  ChildViewController.swift
//  example20190217
//
//  Created by Wouter Bron on 27/2/2019.
//

import UIKit

class ChildViewController: UIViewController {

    var shouldHideTabBar = false

    func hideTabBar(_ isHidden: Bool) {
        //Check if from splitViewController
        if self.splitViewController is MasterViewController {

            //Only hide for compact width sizeClass
            if self.view.traitCollection.horizontalSizeClass == .compact
                && self.view.traitCollection.verticalSizeClass == .regular

                // viewWillAppear is called twice, only hide when called from didSelectCell
                && shouldHideTabBar {
                self.tabBarController?.setTabBarHidden(isHidden, animated: true)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        print(#function)
        super.viewWillAppear(animated)

        hideTabBar(true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
        super.viewWillAppear(animated)

        hideTabBar(false)
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
