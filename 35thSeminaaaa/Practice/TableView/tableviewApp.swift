//
//  tableviewApp.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 10/26/24.
//

import Foundation
import UIKit

struct App {
  let iconImage: UIImage
  let ranking: Int
  let title: String
  let subTitle: String
  let downloadState: DownloadState
  let category: AppCategory
}


enum AppCategory {
  case social
  case entertainment
  case travel
  case sports

}

enum DownloadState {
  case installed
  case download
  case reDownload
  case update
}

extension App {
    static let mockData: [App] = [
        App(iconImage: UIImage(named: "toss")!, ranking: 1, title: "KakaoTalk", subTitle: "카카오톡", downloadState: .installed, category: .social),
        App(iconImage: UIImage(named: "toss")!, ranking: 2, title: "YouTube", subTitle: "유튜브", downloadState: .download, category: .entertainment),
        App(iconImage: UIImage(named: "toss")!, ranking: 3, title: "Naver", subTitle: "네이버", downloadState: .reDownload, category: .social),
        App(iconImage: UIImage(named: "toss")!, ranking: 4, title: "TikTok", subTitle: "틱톡", downloadState: .update, category: .entertainment),
        App(iconImage: UIImage(named: "toss")!, ranking: 5, title: "Instagram", subTitle: "인스타그램", downloadState: .download, category: .social),
        App(iconImage: UIImage(named: "toss")!, ranking: 6, title: "Twitter", subTitle: "트위터", downloadState: .download, category: .social),
        App(iconImage: UIImage(named: "toss")!, ranking: 7, title: "Facebook", subTitle: "페이스북", downloadState: .download, category: .social),
        App(iconImage: UIImage(named: "toss")!, ranking: 8, title: "Netflix", subTitle: "넷플릭스", downloadState: .download, category: .entertainment),
        App(iconImage: UIImage(named: "toss")!, ranking: 9, title: "Spotify", subTitle: "스포티파이", downloadState: .download, category: .entertainment),
        App(iconImage: UIImage(named: "toss")!, ranking: 10, title: "Twitch", subTitle: "트위치", downloadState: .download, category: .entertainment),
        App(iconImage: UIImage(named: "toss")!, ranking: 11, title: "TikTok", subTitle: "틱톡", downloadState: .update, category: .entertainment)
    ]
}
