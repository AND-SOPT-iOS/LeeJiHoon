//
//  DetailViewModel.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/13/24.
//

import Foundation

class DetailViewModel {
    private var appInfo: AppInfo
    
    init(appInfo: AppInfo) {
        self.appInfo = appInfo
    }
    
    var name: String {
        return appInfo.name
    }
    
    var description: String {
        return appInfo.description
    }
    
    var iconName: String {
        return appInfo.iconName
    }
    
    func updateAppInfo(_ app: AppInfo) {
        self.appInfo = app
    }
}
