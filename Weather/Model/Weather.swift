//
//  Weather.swift
//  Weather
//
//  Created by Kamila Sultanova on 19.07.2024.
//

import UIKit

enum Weather {
    case clear, rain, storm, fog, sunny, snowing, cloudly, windy
    
    // MARK: - Properties
    
    var image: UIImage? {
        switch self {
        case .clear: return UIImage(named: "clear")
        case .rain: return UIImage(named: "rain")
        case .storm: return UIImage(named: "storm")
        case .fog: return UIImage(named: "fog")
        case .sunny: return UIImage(named: "sun")
        case .windy: return UIImage(named: "wind")
        case .snowing: return UIImage(named: "snow")
        case .cloudly: return UIImage(named: "cloud")
        }
    }
    
    var color: UIColor {
        switch self {
        case .clear: return .systemCyan.withAlphaComponent(0.6)
        case .rain: return .systemBlue.withAlphaComponent(0.7)
        case .storm: return .black.withAlphaComponent(0.8)
        case .fog: return .lightGray.withAlphaComponent(0.5)
        case .sunny: return .yellow.withAlphaComponent(0.2)
        case .snowing: return .white
        case .cloudly: return .gray
        case .windy: return .systemBlue.withAlphaComponent(0.3)
        }
    }
    
    var localizedType: String {
        switch self {
        case .clear: return NSLocalizedString("clear", comment: "")
        case .rain: return NSLocalizedString("rain", comment: "")
        case .storm: return NSLocalizedString("storm", comment: "")
        case .fog: return NSLocalizedString("fog", comment: "")
        case .sunny: return NSLocalizedString("sunny", comment: "")
        case .windy: return NSLocalizedString("windy", comment: "")
        case .snowing: return NSLocalizedString("snowing", comment: "")
        case .cloudly: return NSLocalizedString("cloudy", comment: "")
        }
    }
}
