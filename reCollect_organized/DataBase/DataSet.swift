//
//  DataSet.swift
//  reCollect_organized
//
//  Created by Daniel Pikovsky Yoffe on 28/07/2023.
//

import Foundation
import Photos

class DataSet {
    static let shared = DataSet()
    static let SignificanceLevelDidChangeNotification = Notification.Name("SignificanceLevelDidChange")

    private init() {}

    public var shownPhotos: [String] = []
    public var approvedPhotosData = [String: ApprovedPhotoData]()

    func addApprovedPhotoData(photoLocation: String, significanceValue: Int) {
        approvedPhotosData[photoLocation] = ApprovedPhotoData(photoLocation: photoLocation, significanceValue: significanceValue)
    }
    
    
    func increaseSignificanceValue(for photoLocation: String, completion: (Int) -> Void) {
        var significanceValue = approvedPhotosData[photoLocation]?.significanceValue ?? 0
        significanceValue = (significanceValue) % 4 + 1
        approvedPhotosData[photoLocation]?.significanceValue = significanceValue
        completion(significanceValue)
        
        NotificationCenter.default.post(name: DataSet.SignificanceLevelDidChangeNotification, object: nil)

    }
    
    func numberOfApprovedPhotos() -> Int {
        return approvedPhotosData.count
    }
    
    // for debugging:
    
    func randomImagesForDataset(numOfPhotos: Int) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        // Add a predicate to exclude screenshots
        fetchOptions.predicate = NSPredicate(format: "mediaType == %d && !(mediaSubtype & %d != 0)", PHAssetMediaType.image.rawValue, PHAssetMediaSubtype.photoScreenshot.rawValue)
        
        let allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)

        let count = allPhotos.count
        if count > 0 {
            for _ in 0..<numOfPhotos {
                let randomIndex = Int(arc4random_uniform(UInt32(count)))
                let randomPhoto = allPhotos.object(at: randomIndex)
                let photoLocation = randomPhoto.localIdentifier
                addApprovedPhotoData(photoLocation: photoLocation, significanceValue: 1)
            }
        }
    }
}


