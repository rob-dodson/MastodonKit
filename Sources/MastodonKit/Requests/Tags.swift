//
//  Tags.swift
//  
//
//  Created by Robert Dodson on 4/30/23.
//

import Foundation

public enum Tags {
    
    /// Fetch info about a single tag
    ///
    ///  - Parameter id: the tag id.
    ///  - Returns: Request for 'Tag'.
    public static func tag(name: String) -> Request<Tag> {
        return Request<Tag>(path: "/api/v1/tags/\(name)")
    }
    
    /// Follow a tag
    ///
    ///  - Parameter id: the tag id.
    ///  - Returns: Request for 'Tag'.
    public static func follow(name: String) -> Request<Tag> {
        return Request<Tag>(path: "/api/v1/tags/\(name)/follow", method: .post(.empty))
    }
    
    /// Unfollow a tag
    ///
    ///  - Parameter id: the tag id.
    ///  - Returns: Request for 'Tag'.
    public static func unfollow(name: String) -> Request<Tag> {
        return Request<Tag>(path: "/api/v1/tags/\(name)/unfollow", method: .post(.empty))
    }
    
    /// Fetch array of all followed tags
    ///
    ///  - Returns: Request for 'Tag'.
    public static func followed_tags() -> Request<[Tag]> {
        return Request<[Tag]>(path: "/api/v1/followed_tags")
    }
}
