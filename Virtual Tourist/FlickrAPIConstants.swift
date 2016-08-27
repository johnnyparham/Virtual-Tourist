//
//  FlickrAPIConstants.swift
//  Virtual Tourist
//
//  Created by Johnny Parham on 8/9/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

extension FlickrAPI {
    
    // Struct responsible to hold all the parameters
    // and it's values
    //
    struct FlickrParamValue {
        
        // parameters
        static let ParamMethod: String = "method"
        static let ParamApiKey: String = "api_key"
        static let ParamSafeSearch: String = "safe_search"
        static let ParamExtras: String = "extras"
        static let ParamFormat: String = "format"
        static let ParamNoJsonCallback: String = "nojsoncallback"
        static let ParamMedia: String = "media"
        static let ParamPerPage: String = "per_page"
        static let ParamMinUploadDate: String = "min_upload_date"
        static let ParamMaxUploadDate: String = "max_upload_date"
        static let ParamPage: String = "page"
        static let ParamLat: String = "lat"
        static let ParamLon: String = "lon"
        
        // values
        static let ValueMethod: String = "flickr.photos.search"
        static let ValueApiKey: String = "9b55bbe6489dbb9c50b3ec3e6ce2ea60"
        static let ValueSafeSearch: String = "1"
        static let ValueExtras: String = "url_c"
        static let ValueFormat: String = "json"
        static let ValueNoJsonCallback: String = "1"
        static let ValueMedia = "photos"
        static let ValuePerPage = "150"
    }
    
    // struct response to hold all JSON tags
    // and expected values
    //
    struct FlickrJSON {
        
        // json tags
        static let TagId: String = "id"
        static let TagUrlM: String = "url_c"
        static let TagPhotos: String = "photos"
        static let TagPhoto: String = "photo"
        static let TagStat: String = "stat"
        static let TagPages: String = "pages"
        
        // expected values
        static let StatOk: String = "ok"
    }
}
