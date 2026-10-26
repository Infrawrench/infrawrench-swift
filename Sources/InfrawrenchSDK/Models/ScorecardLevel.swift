/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ScorecardLevel: Codable, Hashable, Sendable {
    /// Lower-case letters, digits, dashes and underscores; unique.
    public var key: String
    /// At most 40 characters.
    public var name: String
    /// 0 to 100; unique within the scorecard.
    public var minScore: Double
    /// Six-digit hex, e.g. `#d4a72c`.
    public var color: String?

    public init(
        key: String,
        name: String,
        minScore: Double,
        color: String? = nil
    ) {
        self.key = key
        self.name = name
        self.minScore = minScore
        self.color = color
    }
}
