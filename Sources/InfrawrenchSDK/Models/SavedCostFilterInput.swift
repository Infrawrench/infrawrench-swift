/*
 * InfrawrenchSDK v1.23.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.23.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SavedCostFilterInput: Codable, Hashable, Sendable {
    public var name: String
    public var description: String?
    /// The structured filter. May be omitted only when `query` is sent instead.
    public var filters: [SavedCostFilterTerm]?
    /// The same filter written in the cost query language — an alternative
    /// spelling of `filters`, compiled server-side into exactly that structure.
    /// Sending both a query and a non-empty `filters` is a 400, not a precedence
    /// rule. Whichever spelling is used, the result must be non-empty (an empty
    /// saved filter matches everything, which is the same as no filter wearing a
    /// name) and every tag term must carry its key.
    public var query: String?

    public init(
        name: String,
        description: String? = nil,
        filters: [SavedCostFilterTerm]? = nil,
        query: String? = nil
    ) {
        self.name = name
        self.description = description
        self.filters = filters
        self.query = query
    }
}
