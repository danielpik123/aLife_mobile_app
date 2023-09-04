//
//  ApprovedPhotoData.swift
//  reCollect_organized
//
//  Created by Daniel Pikovsky Yoffe on 28/07/2023.
//

import Foundation

class ApprovedPhotoData {
    let photoLocation: String
    var significanceValue: Int

    init(photoLocation: String, significanceValue: Int) {
        self.photoLocation = photoLocation
        self.significanceValue = significanceValue
    }
}
