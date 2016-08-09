//
//  FlickrConstants.swift
//  Virtual Tourist
//
//  Created by Johnny Parham on 8/9/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import Foundation

extension FlickrClient {
    
    // MARK: - Constants
    struct Constants {
        // API Key
        static let APIKey = "9b55bbe6489dbb9c50b3ec3e6ce2ea60"
        
        // Base URL
        static let BaseURL = "https://api.flickr.com/services/rest/"
    }
    
    // MARK: - Methods
    struct  Methods {
        static let Search = "flickr.photos.search"
    }
    
    // MARK: - URL Keys
    struct URLKeys {
        static let APIKey = "api_key"
        static let BoundingBox = "bbox"
        static let Format = "format"
        static let Extras = "extras"
        static let Latitude = "lat"
        static let Longitude = "lon"
        static let Method = "method"
        static let NoJSONCallback = "nojsoncallback"
        static let Page = "page"
        static let PerPage = "per_page"
    }
    
    // MARK: - URL Values
    struct  URLValues {
        static let JSONFormat = "json"
        static let URLMediumPhoto = "url_m"
    }
    
    // MARK: - JSON Response Values
    
    struct  JSONResponseValues {
        static let Fail = "fail"
        static let OK = "ok"
    }
}