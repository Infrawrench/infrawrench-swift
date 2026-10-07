/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Which columns an object carries. `native` is Infrawrench's own layout, shaped
/// by `query.dimensions` and `query.tagKeys`. `focus-1.4` and `focus-1.3` write
/// the FinOps Open Cost and Usage Specification columns of that version at the
/// full row grain (1.4 drops the deprecated `ProviderName` and `PublisherName`),
/// with `BilledCost` (cash) and `EffectiveCost` (amortized) side by side;
/// `query.dimensions`, `query.tagKeys` and `query.costBasis` do not apply to it,
/// `query.filters` and `query.chargeTypes` still do.
public enum CostExportSchema: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case native
    case focus14
    case focus13
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "native": self = .native
        case "focus-1.4": self = .focus14
        case "focus-1.3": self = .focus13
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .native: return "native"
        case .focus14: return "focus-1.4"
        case .focus13: return "focus-1.3"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [CostExportSchema] = [
        .native,
        .focus14,
        .focus13,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
