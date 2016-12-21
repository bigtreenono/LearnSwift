//
//  About.swift
//  TurnOnVPN
//
//  Created by Jeff on 20/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import MessageUI

let kReviewCellIndex = 1
let kFeedbackCellIndex = 2

class About: UITableViewController, MFMailComposeViewControllerDelegate {
    
//    override func loadView() {
//        super.loadView()
//        tableView.backgroundView = ControllerBackgroundView()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == kReviewCellIndex {
            UIApplication.shared.openURL(URL(string: "https://itunes.apple.com/app/vpn-on/id951344279")!)
        } else if indexPath.row == kFeedbackCellIndex {
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self
            mailComposerVC.setToRecipients(["lexrus@gmail.com"])
            mailComposerVC.setSubject("[VPN On] Feedback \(appVersion())")
            
            let osVersion = ProcessInfo().operatingSystemVersion
            let osVersionString = "\(osVersion.majorVersion).\(osVersion.minorVersion).\(osVersion.patchVersion)"
            
            let deviceInfo = "<small style='color:#999'>iOS \(osVersionString)"
                + " | Model: \(device())</small><br/>"
                + "<small style='color:green'>Please feel free to comment or advise if you have anything to say.</small> 🤓<br/><br/>"
            mailComposerVC.setMessageBody(deviceInfo, isHTML: true)
            
            present(mailComposerVC, animated: true)
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return appVersion()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if MFMailComposeViewController.canSendMail() {
            return 3
        }
        return 2
    }
    
    private func appVersion() -> String {
        if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
            return version
        }
        return ""
    }
    
    private func osVersion() -> String {
        return ProcessInfo().operatingSystemVersionString
    }
    
    private func device() -> String {
        var sysinfo = utsname()
        _ = uname(&sysinfo)
        return NSString(bytes: &sysinfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)! as String
    }

}


































