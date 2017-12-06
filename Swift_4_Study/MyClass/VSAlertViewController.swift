//
//  VSAlertViewController.swift
//  Swift_4_Study
//
//  Created by cooperLink on 2017/12/4.
//  Copyright © 2017年 cooperLink. All rights reserved.
//

import UIKit

//                               (alertController, buttonTitle, buttonIndex)
typealias VSAlertActionHandler = (VSAlertViewController?, String, NSInteger) -> Swift.Void


class VSAlertViewController: UIAlertController {
    
    // MARK: Alert
    
    /// preset an alertController from rootViewController of the application's first window.
    ///
    /// - Parameters:
    ///   - title: title of alert, it can be passed nil.
    ///   - message: content of alert, it can be passed nil.
    ///   - buttonTitles: titles of alertAciton. if it is passed nil or empty array, the alert will automatic hidden after 2.5s.
    ///   - actionHandler: callback handler. It will be called after clicking a button.
    static func presentAlert(_ title: String?,
                             message: String?,
                             buttonTitles: [String]?,
                             actionHandler: VSAlertActionHandler? = nil) {
        let rootController = UIApplication.shared.windows[0].rootViewController;
        if let presentedController = rootController {
            presentAlert(presentedController, title: title, message: message, buttonTitles: buttonTitles, actionHandler: actionHandler)
        }
    }
    
    
    
    /// preset an alertController from presentedController
    ///
    /// - Parameters:
    ///   - presentedController: a ViewController to present AlertController
    ///   - title: title of alert, it can be passed nil.
    ///   - message: content of alert, it can be passed nil.
    ///   - buttonTitles: titles of alertAciton. if it is passed nil or empty array, the alert will automatic hidden after 2.5s.
    ///   - actionHandler: callback handler. It will be called after clicking a button.
    static func presentAlert(_ presentedController: UIViewController,
                             title: String?,
                             message: String?,
                             buttonTitles: [String]?,
                             actionHandler: VSAlertActionHandler? = nil) {
        presentAlertController(presentedController, sourceView: nil, title: title, message: message, preferredStyle: .alert, buttonTitles: buttonTitles, actionHandler: actionHandler)
    }
    
    
    // MARK: ActionSheet
    
    /// preset an ActionSheetController from rootViewController of the application's first window.
    ///
    /// - Parameters:
    ///   - sourceView: sourceView of ActionSheet. it can not be nil
    ///   - title: title of ActionSheet, it can be passed nil.
    ///   - message: content of ActionSheet, it can be passed nil.
    ///   - buttonTitles: titles of alertAciton. if it is passed nil or empty array, the alert will automatic hidden after 2.5s.
    ///   - actionHandler: callback handler. It will be called after clicking a button.
    static func presentActionSheet(_ sourceView: UIView,
                                   title: String?,
                                   message: String?,
                                   buttonTitles: [String]?,
                                   actionHandler: VSAlertActionHandler? = nil) {
        let rootController = UIApplication.shared.windows[0].rootViewController;
        if let presentedController = rootController {
          presentActionSheet(presentedController, sourceView: sourceView, title: title, message: message, buttonTitles: buttonTitles, actionHandler: actionHandler)
        }
    }
    
    /// preset an ActionSheetController from presentedController
    ///
    /// - Parameters:
    ///   - presentedController: a ViewController to present ActionSheetController
    ///   - sourceView: sourceView of ActionSheet. it can not be nil
    ///   - title: title of ActionSheet, it can be passed nil.
    ///   - message: content of ActionSheet, it can be passed nil.
    ///   - buttonTitles: titles of alertAciton. if it is passed nil or empty array, the alert will automatic hidden after 2.5s.
    ///   - actionHandler: callback handler. It will be called after clicking a button.
    static func presentActionSheet(_ presentedController: UIViewController,
                                   sourceView: UIView,
                                   title: String?,
                                   message: String?,
                                   buttonTitles: [String]?,
                                   actionHandler: VSAlertActionHandler? = nil) {
        presentAlertController(presentedController, sourceView: sourceView, title: title, message: message, preferredStyle: .actionSheet, buttonTitles: buttonTitles, actionHandler: actionHandler)
    }
    
    
    // MARK: AlertController common function
    
    /// preset an alertController from presentedController
    ///
    /// - Parameters:
    ///   - presentedController: a ViewController to present alertController
    ///   - sourceView: sourceView of ActionSheet. it can not be nil, if preferredStyle is actionSheet
    ///   - delayTime: if buttonTitles are passed nil or empty array, the alertController will automatic hidden after delayTime second.
    ///   - title: title of ActionSheet, it can be passed nil.
    ///   - message: content of ActionSheet, it can be passed nil.
    ///   - preferredStyle: UIAlertControllerStyle of alertController (alert or actionSheet).
    ///   - buttonTitles: titles of alertAciton.
    ///   - actionHandler: callback handler. It will be called after clicking a button.
    static func presentAlertController(_ presentedController: UIViewController,
                                       sourceView: UIView?,
                                       delayTime: TimeInterval = VSAlertViewController.DefaultDelayTime, // default 2.5
                                       title: String?,
                                       message: String?,
                                       preferredStyle: UIAlertControllerStyle,
                                       buttonTitles: [String]?,
                                       actionHandler: VSAlertActionHandler? = nil) {
        
        let alertViewController = alertView(title, message: message, preferredStyle: preferredStyle, buttonTitles: buttonTitles, delayTime: delayTime, actionHandler: actionHandler);
        
        if let popover = alertViewController.popoverPresentationController {
            assert(sourceView != nil, "SourceView of actionSheet can not be nil")
            popover.sourceView = sourceView!;
            popover.sourceRect = sourceView!.bounds;
        }
        
        presentedController.present(alertViewController, animated: true, completion: nil)
        
    }

}

// MARK: init VSAlertViewController
fileprivate extension VSAlertViewController {
    
    private static let DefaultDelayTime: TimeInterval = 2.5
    
    /// init an alertController
    ///
    /// - Parameters:
    ///   - title: title of ActionSheet, it can be passed nil.
    ///   - message: content of ActionSheet, it can be passed nil.
    ///   - preferredStyle: UIAlertControllerStyle of alertController (alert or actionSheet).
    ///   - buttonTitles: titles of alertAciton.
    ///   - delayTime: if buttonTitles are passed nil or empty array, the alertController will automatic hidden after delayTime second.
    ///   - actionHandler: callback handler. It will be called after clicking a button.
    /// - Returns: returen an alertController
    static private func alertView(_ title: String?,
                                  message: String?,
                                  preferredStyle: UIAlertControllerStyle,
                                  buttonTitles: [String]?,
                                  delayTime: TimeInterval,
                                  actionHandler: VSAlertActionHandler? = nil) ->  VSAlertViewController {
        
        let alertController = VSAlertViewController(title: title, message: message, preferredStyle: preferredStyle)
        
        if let btnTitles = buttonTitles, btnTitles.count > 0 {
            // add alert action
            alertController.addAlertAction(btnTitles, actionHandler: actionHandler)
        } else {
            // if you not set buttons, the alert will automatic hidden after delay time(default 2.5s)
            let delayT = delayTime > 0 ? delayTime : VSAlertViewController.DefaultDelayTime;
            alertController.dismissAfter(delayT, actionHandler: actionHandler)
        }
        return alertController
    }
    
    // add alert action
    private func addAlertAction(_ buttonTitles: [String],
                                actionHandler: VSAlertActionHandler? = nil) {
        
        for (index, title) in buttonTitles.enumerated() {
            let alertAction = UIAlertAction(title: title, style: .default, handler: {[unowned self] (alertAction) in
                if let alertActionHandler = actionHandler {
                    alertActionHandler(self, title, index)
                }
            })
            
            self.addAction(alertAction)
        }
    }
    
    // dismiss after delay time
    private func dismissAfter(_ delayTime: TimeInterval,
                              actionHandler: VSAlertActionHandler? = nil) {
        DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + delayTime), execute: {[unowned self] in
            if let alertActionHandler = actionHandler {
                alertActionHandler(self, "", -1)
            }
            self.dismiss(animated: true, completion: nil)
        })
    }
}




