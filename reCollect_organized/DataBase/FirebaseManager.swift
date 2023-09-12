//
//  FirebaseManager.swift
//  reCollect_organized
//
//  Created by Daniel Pikovsky Yoffe on 07/09/2023.
//

import FirebaseStorage
import FirebaseFirestore

class FirebaseManager {
    static let shared = FirebaseManager()
    private let storage = Storage.storage()
    private let firestore = Firestore.firestore()
    
    // This function uploads the local identifier, significance rating, and the actual image
    func uploadPhoto(localIdentifier: String, significanceRating: Int, image: UIImage, completion: @escaping (Error?) -> Void) {
        
        // Convert the UIImage to Data
        guard let imageData = image.jpegData(compressionQuality: 0.75) else {
            completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"]))
            return
        }

        // Set the storage reference
        let storageRef = storage.reference().child("approved_photos/\(localIdentifier).jpg")

        // Upload the image to Firebase Storage
        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                completion(error)
                return
            }
            
            // Once the image is uploaded, save the metadata to Firestore
            let photoData: [String: Any] = [
                "localIdentifier": localIdentifier,
                "significanceRating": significanceRating
            ]
            
            self.firestore.collection("approved_photos").document(localIdentifier).setData(photoData) { error in
                completion(error)
            }
        }
    }
    
    // This function updates the significance rating for a specific local identifier
    func updateSignificanceRating(for localIdentifier: String, newRating: Int, completion: @escaping (Error?) -> Void) {
        firestore.collection("approved_photos").document(localIdentifier).updateData([
            "significanceRating": newRating
        ]) { error in
            completion(error)
        }
    }
}
