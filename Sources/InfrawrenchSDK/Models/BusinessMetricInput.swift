/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricInput: Codable, Hashable, Sendable {
    /// Stable lowercase slug (letters, digits, `_ . -`) that workflows and the
    /// CLI address the metric by. Unique per organization among live metrics, and
    /// independent of `name` so a rename never breaks a running job.
    public var key: String
    public var name: String
    /// Singular unit label used for display — the noun in "USD per customer".
    public var unit: String
    public var description: String?
    public var kind: BusinessMetricKind
    /// ISO-4217 code. **Required when `kind` is `currency`, and rejected
    /// otherwise** — a revenue metric with no currency cannot have margin
    /// computed against it, and a count metric carrying one would suggest its
    /// numbers are money when they are requests.
    public var currency: String?
    /// The spend this metric divides, in the same filter vocabulary cost graphs
    /// and budgets use. Empty (the default) is all of the organization's spend. A
    /// unit-cost query may narrow this further but can never widen it: the scope
    /// is part of what the metric means, and a caller who could drop it would be
    /// answering a different question under the same name.
    public var costScope: [BusinessMetricScopeTerm]?
    /// A saved cost filter AND-composed with `costScope`, resolved server-side at
    /// query time. A reference that fails to resolve errors the unit-cost query
    /// rather than silently widening the numerator to all spend.
    public var savedFilterId: String?

    public init(
        key: String,
        name: String,
        unit: String,
        description: String? = nil,
        kind: BusinessMetricKind,
        currency: String? = nil,
        costScope: [BusinessMetricScopeTerm]? = nil,
        savedFilterId: String? = nil
    ) {
        self.key = key
        self.name = name
        self.unit = unit
        self.description = description
        self.kind = kind
        self.currency = currency
        self.costScope = costScope
        self.savedFilterId = savedFilterId
    }
}
