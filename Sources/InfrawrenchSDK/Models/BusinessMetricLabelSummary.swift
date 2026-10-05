/*
 * InfrawrenchSDK v1.71.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.71.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricLabelSummary: Codable, Hashable, Sendable {
    public var key: String
    /// Distinct values, alphabetical, at most 500.
    public var values: [String]
    public var truncated: Bool
    public var mapping: BusinessMetricLabelTarget?

    public init(
        key: String,
        values: [String],
        truncated: Bool,
        mapping: BusinessMetricLabelTarget? = nil
    ) {
        self.key = key
        self.values = values
        self.truncated = truncated
        self.mapping = mapping
    }
}
