/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostFilter: Codable, Hashable, Sendable {
    public var dimension: CostDimension
    public var op: CostFilterOperator
    /// Values to compare with. At least one, except for `is_set` and
    /// `is_not_set`, which take an empty list. The text operators refuse an empty
    /// string.
    public var values: [String]
    public var tagKey: String?

    public init(
        dimension: CostDimension,
        op: CostFilterOperator,
        values: [String],
        tagKey: String? = nil
    ) {
        self.dimension = dimension
        self.op = op
        self.values = values
        self.tagKey = tagKey
    }
}
