/*
 * InfrawrenchSDK v1.70.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.70.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Joins a label to a cost dimension so unit cost and margin can be computed per
/// label value (cost per customer). Ratio modes refuse an unmapped label: without
/// a per-value numerator the only spend available is the whole scope's.
public struct BusinessMetricLabelMapping: Codable, Hashable, Sendable {
    /// A label key: a lowercase slug, normalised (trimmed, lowercased) on write.
    public var label: String
    public var target: BusinessMetricLabelTarget

    public init(
        label: String,
        target: BusinessMetricLabelTarget
    ) {
        self.label = label
        self.target = target
    }
}
