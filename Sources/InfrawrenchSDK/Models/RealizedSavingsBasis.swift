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

/// `billing`: baseline and post-action spend both read from this resource's cost
/// rows; `estimate`: no per-resource billing, so the list-price estimate is
/// accrued over elapsed days; `manual`: the logged amount accrued; `unmeasured`:
/// nothing to measure against (never summed as zero).
public enum RealizedSavingsBasis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case billing
    case estimate
    case manual
    case unmeasured
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "billing": self = .billing
        case "estimate": self = .estimate
        case "manual": self = .manual
        case "unmeasured": self = .unmeasured
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .billing: return "billing"
        case .estimate: return "estimate"
        case .manual: return "manual"
        case .unmeasured: return "unmeasured"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [RealizedSavingsBasis] = [
        .billing,
        .estimate,
        .manual,
        .unmeasured,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
