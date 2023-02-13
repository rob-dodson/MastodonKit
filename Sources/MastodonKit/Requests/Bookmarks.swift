//
//  Bookmarks.swift
//
//
//  Created by Robert Dodson on 2/5/23.
//

import Foundation

/// `Bookmarks` requests.
public enum Bookmarks {
    /// Fetches a user's bookmarks.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Status]`.
    public static func all(range: RequestRange = .default) -> Request<[Status]> {
        let parameters = range.parameters(limit: between(1, and: 40, default: 20))
        let method = HTTPMethod.get(.parameters(parameters))

        return Request<[Status]>(path: "/api/v1/bookmarks", method: method)
    }
}
