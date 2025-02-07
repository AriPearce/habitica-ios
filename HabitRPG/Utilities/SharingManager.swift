//
//  SharingManager.swift
//  Habitica
//
//  Created by Phillip Thelen on 17.08.20.
//  Copyright © 2020 HabitRPG Inc. All rights reserved.
//

import UIKit
#if !targetEnvironment(macCatalyst)
import FirebaseAnalytics
#endif

class SharingManager {
    static func share(identifier: String, items: [Any], presentingViewController: UIViewController?, sourceView: UIView?) {
        guard let viewController = presentingViewController ?? UIApplication.topViewController() else {
            return
        }
        let avc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        avc.popoverPresentationController?.sourceView = sourceView ?? viewController.view
        viewController.present(avc, animated: true, completion: nil)
        #if !targetEnvironment(macCatalyst)
        Analytics.logEvent("shared", parameters: ["identifier": identifier])
        #endif
    }
}
