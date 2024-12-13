//
//  appData.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 11/27/24.
//

import Foundation

// MARK: - Models
struct AppInfo: Identifiable {
    let id = UUID()
    let name: String
    let rank: Int
    let description: String
    let iconName: String
    let buttonType: ButtonType
    let appIcon: String
}

enum ButtonType {
    case update
    case receive
    case download
    case cloud
}

// MARK: - Sample Data
struct AppData {
    static let freeApps = [
        AppInfo(name: "토스", rank: 1, description: "금융이 위대해진다", iconName: "dollarsign.circle.fill", buttonType: .update, appIcon: "toss"),
        AppInfo(name: "카카오뱅크", rank: 2, description: "이미 모두의 은행", iconName: "banknote.fill", buttonType: .receive, appIcon: "kakaobank"),
        AppInfo(name: "현대백화점", rank: 3, description: "쇼핑의 모든 것", iconName: "bag.fill", buttonType: .download, appIcon: "hyundai"),
        AppInfo(name: "monimo", rank: 4, description: "모이는 금융, 커지는 혜택!", iconName: "m.circle.fill", buttonType: .download, appIcon: "monimo"),
        AppInfo(name: "KB Pay", rank: 5, description: "모든 금융을 한번에", iconName: "creditcard.fill", buttonType: .cloud, appIcon: "kb"),
        AppInfo(name: "네이버 페이", rank: 6, description: "스마트한 결제생활", iconName: "creditcard.fill", buttonType: .download, appIcon: "naverpay"),
        AppInfo(name: "배달의민족", rank: 7, description: "대한민국 1등 배달앱", iconName: "bicycle", buttonType: .update, appIcon: "baemin"),
        AppInfo(name: "요기요", rank: 8, description: "즐거운 배달생활", iconName: "fork.knife", buttonType: .download, appIcon: "yogiyo"),
        AppInfo(name: "쿠팡", rank: 9, description: "로켓배송", iconName: "cart.fill", buttonType: .receive, appIcon: "coupang"),
        AppInfo(name: "카카오톡", rank: 10, description: "대한민국 대표 메신저", iconName: "message.fill", buttonType: .update, appIcon: "kakaotalk"),
        AppInfo(name: "당근마켓", rank: 11, description: "동네 중고거래", iconName: "cart.fill", buttonType: .download, appIcon: "karrot"),
        AppInfo(name: "네이버", rank: 12, description: "모든 검색과 생활", iconName: "magnifyingglass", buttonType: .receive, appIcon: "naver"),
        AppInfo(name: "유튜브", rank: 13, description: "동영상 플랫폼", iconName: "play.fill", buttonType: .update, appIcon: "youtube"),
        AppInfo(name: "넷플릭스", rank: 14, description: "글로벌 스트리밍", iconName: "play.tv.fill", buttonType: .download, appIcon: "netflix"),
        AppInfo(name: "왓챠", rank: 15, description: "영화와 드라마", iconName: "tv.fill", buttonType: .cloud, appIcon: "watcha"),
        AppInfo(name: "디즈니플러스", rank: 16, description: "무한한 즐거움", iconName: "sparkles.tv.fill", buttonType: .download, appIcon: "disney"),
        AppInfo(name: "인스타그램", rank: 17, description: "사진과 영상 공유", iconName: "camera.fill", buttonType: .update, appIcon: "instagram"),
        AppInfo(name: "스포티파이", rank: 18, description: "음악 스트리밍", iconName: "music.note", buttonType: .receive, appIcon: "spotify"),
        AppInfo(name: "멜론", rank: 19, description: "대한민국 음악앱", iconName: "headphones", buttonType: .download, appIcon: "melon"),
        AppInfo(name: "지니", rank: 20, description: "음악을 더 쉽게", iconName: "music.mic", buttonType: .cloud, appIcon: "genie")
    ]
    
    static let paidApps = [
        AppInfo(name: "Minecraft", rank: 1, description: "샌드박스 게임의 정석", iconName: "gamecontroller.fill", buttonType: .download, appIcon: "minecraft"),
        AppInfo(name: "ProCam", rank: 2, description: "전문가용 카메라", iconName: "camera.fill", buttonType: .download, appIcon: "procam"),
        AppInfo(name: "GoodNotes", rank: 3, description: "디지털 필기의 혁신", iconName: "pencil", buttonType: .download, appIcon: "goodnotes"),
        AppInfo(name: "Notability", rank: 4, description: "스마트한 노트 앱", iconName: "note.text", buttonType: .download, appIcon: "notability"),
        AppInfo(name: "FaceTune", rank: 5, description: "셀카 보정의 예술", iconName: "camera.filters", buttonType: .download, appIcon: "facetune"),
        AppInfo(name: "Forest", rank: 6, description: "집중력 향상 앱", iconName: "leaf.fill", buttonType: .download, appIcon: "forest"),
        AppInfo(name: "Dark Sky", rank: 7, description: "정밀한 날씨 예보", iconName: "cloud.fill", buttonType: .download, appIcon: "darksky"),
        AppInfo(name: "Things 3", rank: 8, description: "할 일 관리의 정석", iconName: "checkmark.circle", buttonType: .download, appIcon: "things"),
        AppInfo(name: "1Password", rank: 9, description: "비밀번호 관리자", iconName: "lock.fill", buttonType: .download, appIcon: "1password"),
        AppInfo(name: "Fantastical", rank: 10, description: "캘린더의 혁신", iconName: "calendar", buttonType: .download, appIcon: "fantastical"),
        AppInfo(name: "Affinity Photo", rank: 11, description: "전문가용 사진 편집", iconName: "photo.fill", buttonType: .download, appIcon: "affinity"),
        AppInfo(name: "Procreate", rank: 12, description: "디지털 아트의 정석", iconName: "paintbrush.fill", buttonType: .download, appIcon: "procreate"),
        AppInfo(name: "LumaFusion", rank: 13, description: "모바일 영상 편집", iconName: "video.fill", buttonType: .download, appIcon: "lumafusion"),
        AppInfo(name: "Monument Valley", rank: 14, description: "아름다운 퍼즐게임", iconName: "puzzle.piece.fill", buttonType: .download, appIcon: "monument"),
        AppInfo(name: "Facetime+", rank: 15, description: "화상통화의 진화", iconName: "video.circle.fill", buttonType: .download, appIcon: "facetime"),
        AppInfo(name: "Scanner Pro", rank: 16, description: "전문가용 스캐너", iconName: "doc.text.fill", buttonType: .download, appIcon: "scanner"),
        AppInfo(name: "VSCO X", rank: 17, description: "프리미엄 사진 편집", iconName: "camera.filters", buttonType: .download, appIcon: "vsco"),
        AppInfo(name: "Halide", rank: 18, description: "수동 카메라 컨트롤", iconName: "camera.aperture", buttonType: .download, appIcon: "halide"),
        AppInfo(name: "Pixelmator", rank: 19, description: "강력한 이미지 편집", iconName: "wand.and.stars", buttonType: .download, appIcon: "pixelmator"),
        AppInfo(name: "DJI Fly", rank: 20, description: "드론 컨트롤의 정석", iconName: "airplane", buttonType: .download, appIcon: "dji")
    ]
}
