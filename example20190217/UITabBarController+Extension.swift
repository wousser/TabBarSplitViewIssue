//
//  UITabBarController+Extension.swift
//  SuperSocial
//
//  Created by Wouter Bron on 27/2/2019.
//  Copyright © 2019 Wouter Bron. All rights reserved.
//

import UIKit

extension UITabBarController {
    func setTabBarHidden(_ isHidden: Bool, animated: Bool, completion: (() -> Void)? = nil ) {
        if (tabBar.isHidden == isHidden) {
            completion?()
        }

        if !isHidden {
            tabBar.isHidden = false
        }

        let height = tabBar.frame.size.height
        let offsetY = view.frame.height - (isHidden ? 0 : height)
        let duration = (animated ? 0.25 : 0.0)

        let frame = CGRect(origin: CGPoint(x: tabBar.frame.minX, y: offsetY), size: tabBar.frame.size)
        UIView.animate(withDuration: duration, animations: {
            self.tabBar.frame = frame
        }) { _ in
            self.tabBar.isHidden = isHidden
            completion?()
        }
    }
}
