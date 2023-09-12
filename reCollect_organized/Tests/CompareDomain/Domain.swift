//
//  Domain.swift
//  reCollect_organized
//
//  Created by Daniel Pikovsky Yoffe on 07/09/2023.
//

import Foundation

enum Domain: String {
    case recency = "Recency"
    case duration = "Duration"
    case significance = "Significance"
    case emotional = "Emotional"
    case aesthetics = "Aesthetics"
    case vividness = "Vividness"
    
    var svgFileName: String {
        switch self {
        case .recency: return "recency.svg"
        case .duration: return "duration.svg"
        case .significance: return "significance.svg"
        case .emotional: return "emotional.svg"
        case .aesthetics: return "aesthetics.svg"
        case .vividness: return "vividness.svg"
        }
    }
    
    var caption: String {
        switch self {
        case .recency: return "   Which event happened more recently  "
        case .duration: return "   Which event was longer?  "
        case .significance: return "   Which event was more significant?  "
        case .emotional: return "   Which event was more emotional?  "
        case .aesthetics: return "   Which photo is more aethetic?  "
        case .vividness: return "   Which event do you remember more vividly?  "
        }
    }
}
