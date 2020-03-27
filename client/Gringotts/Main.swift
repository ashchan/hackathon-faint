//
// UDT Hackathon Project Gringotts by Team Goblins
// Copyright © 2020 Goblins. all rights reserved.
// 

import Cocoa
import SwiftUI

class HostingController: NSHostingController<AnyView> {
    private var store = Store()

    @objc required dynamic init?(coder: NSCoder) {
        super.init(coder: coder, rootView: AnyView(RootView().environmentObject(store)))
    }

    @IBAction func selectTab(_ sender: Any) {
        let index: AppState.ViewTab.Index
        let selectedSegment = (sender as! NSSegmentedControl).selectedSegment
        if selectedSegment == 1 {
            index = .borrower
        } else if selectedSegment == 2 {
            index = .market
        } else {
            index = .lender
        }
        store.state.viewTab.selected = index
        print("Switch to view(tab) \(store.state.viewTab.selected)")
    }

    @IBAction func showSettings(_ sender: Any) {
        NotificationCenter.default.post(name: .showSettingsView, object: nil)
    }
}

extension Notification.Name {
    static let showSettingsView = Notification.Name("showSettingsView")
}
