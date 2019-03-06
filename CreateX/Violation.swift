//
//  Violation.swift
//  Tatl
//
//  Created by Chris Truong on 11/15/18.
//  Copyright © 2018 Chris Truong. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class Violation {
	
    public var KeyFrameimage: UIImage!
    public var videoURL: String!
    public var date: String!
    public var location: String!
    public var time: String!
	
	public func Violation(videoURL: String, date: String, location: String, time: String) {
		self.videoURL = videoURL
		self.date = date
		self.location = location
		self.time = time
		self.KeyFrameimage = createKeyFrameImage()
	}
	
	func createKeyFrameImage() -> UIImage? {
		
		let asset = AVURLAsset(url: URL(string: self.videoURL)!)
		let generator = AVAssetImageGenerator(asset: asset)
		generator.appliesPreferredTrackTransform = true
		let timestamp = CMTime(seconds: 2, preferredTimescale: 60)
		if let imageRef = try? generator.copyCGImage(at: timestamp, actualTime: nil) {
			return UIImage(cgImage: imageRef)
		} else {
			return nil
		}
		
	}
	
	
	
}
