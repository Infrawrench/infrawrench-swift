/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrgScorecardFact: Codable, Hashable, Sendable {
    public var label: String
    public var value: String
    /// True when this is the number that hurts.
    public var bad: Bool?

    public init(
        label: String,
        value: String,
        bad: Bool? = nil
    ) {
        self.label = label
        self.value = value
        self.bad = bad
    }
}
