//
//  ImageDetectionViewModel.swift
//  CorelmageSwiftUIIntegration
//
//  Created by Dominik Woźniak on 15/04/2022.
//

import Foundation
import SwiftUI
import Combine

class ImageDetectionViewModel: ObservableObject {
    
    var name: String = ""
    var manager: ImageDetectionManager
    
    @Published var predictionLabel: String = ""
    
    init(manager: ImageDetectionManager){
        self.manager = manager
    }
    func detect(_ name: String){
        
        let sourceImage = UIImage(named: name)
        
        guard let resizedImage = sourceImage?.resizeImage(targetSize: CGSize(width: 224, height: 224)) else{
            fatalError("Unable to resize the image !")
        }
        if let lebel = self.manager.detect(resizedImage){
            self.predictionLabel = lebel
        }
    }
}
