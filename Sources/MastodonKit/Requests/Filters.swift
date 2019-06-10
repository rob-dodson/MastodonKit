//
//  Filters.swift
//  MastodonKit
//
//  Created by Bruno Philipe on 10.06.19.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum FilterRequests {

	/// Fetches a list of text filters configured by the user.
	///
	/// - Returns: Request for `[Filter]`.
	public static func all() -> Request<[Filter]> {
		return Request<[Filter]>(path: "/api/v1/filters")
	}

	/// Create a new filter.
	///
	/// - Parameters:
	///   - phrase: Keyword or phrase to filter.
	///   - context: Array of filter contexts.
	///   - irreversible: Whether the filtering should be done by the server.
	///   - wholeWord: Whether to consider word boundaries when matching
	///   - expiresIn: Filter will expire after this amount of seconds. Leave blank for no expiration.
	/// - Returns: Request for `Filter`.
	public static func create(phrase: String,
							  context: [Filter.Context],
							  irreversible: Bool? = nil,
							  wholeWord: Bool? = nil,
							  expiresIn: Date? = nil) -> Request<Filter> {
		let method = HTTPMethod.post(postPutPayload(phrase: phrase, context: context, irreversible: irreversible,
													wholeWord: wholeWord, expiresIn: expiresIn))
		return Request<Filter>(path: "/api/v1/filters", method: method)
	}

	/// Update a filter.
	///
	/// - Parameters:
	///   - id: The filter id.
	///   - phrase: Keyword or phrase to filter.
	///   - context: Array of filter contexts.
	///   - irreversible: Whether the filtering should be done by the server.
	///   - wholeWord: Whether to consider word boundaries when matching
	///   - expiresIn: Filter will expire after this amount of seconds. Leave blank for no expiration.
	/// - Returns: Request for `Filter`.
	public static func create(id: String,
							  phrase: String,
							  context: [Filter.Context],
							  irreversible: Bool? = nil,
							  wholeWord: Bool? = nil,
							  expiresIn: Date? = nil) -> Request<Filter> {
		let method = HTTPMethod.put(postPutPayload(phrase: phrase, context: context, irreversible: irreversible,
												   wholeWord: wholeWord, expiresIn: expiresIn))
		return Request<Filter>(path: "/api/v1/filters/\(id)", method: method)
	}

	/// Fetches a text filter configured by the user via id.
	///
	/// - Parameters:
	///   - id: The filter id.
	/// - Returns: Request for `Filter`.
	public static func filter(id: String) -> Request<Filter> {
		return Request<Filter>(path: "/api/v1/filters/\(id)")
	}

	/// Delete a text filter configured by the user via id.
	///
	/// - Parameters:
	///   - id: The filter id.
	/// - Returns: Request for `Empty`.
	public static func delete(id: String) -> Request<Empty> {
		return Request<Empty>(path: "/api/v1/filters/\(id)", method: .delete(Payload.empty))
	}

	private static func postPutPayload(phrase: String,
									   context: [Filter.Context],
									   irreversible: Bool? = nil,
									   wholeWord: Bool? = nil,
									   expiresIn: Date? = nil) -> Payload {
		let parameters = [
			Parameter(name: "phrase", value: phrase),
			Parameter(name: "context", value: context.map({$0.rawValue}).joined(separator: ",")),
			Parameter(name: "irreversible", value: irreversible.flatMap(trueOrNil)),
			Parameter(name: "wholeWord", value: wholeWord.flatMap(trueOrNil)),
			Parameter(name: "expiresIn", value: expiresIn.map({"\(Int($0.timeIntervalSinceNow))"}))
		]

		return .parameters(parameters)
	}
}
