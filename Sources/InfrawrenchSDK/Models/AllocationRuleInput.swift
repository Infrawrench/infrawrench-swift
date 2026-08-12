/*
 * InfrawrenchSDK v1.20.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.20.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AllocationRuleInput: Codable, Hashable, Sendable {
    public var costCentreId: String
    /// Lower fires first; the first matching rule wins.
    public var priority: Int
    public var match: AllocationRuleMatch

    public init(
        costCentreId: String,
        priority: Int,
        match: AllocationRuleMatch
    ) {
        self.costCentreId = costCentreId
        self.priority = priority
        self.match = match
    }
}
