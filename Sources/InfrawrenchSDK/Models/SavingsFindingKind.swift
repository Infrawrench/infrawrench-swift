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

/// Which finder reported it: `orphan` (orphaned or idle resource), `oversized`
/// (right-sizing), `extended_support` (a version past standard support), `seat`
/// (an unused, duplicate or downgradable SaaS seat).
public enum SavingsFindingKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case orphan
    case oversized
    case extendedSupport
    case seat
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "orphan": self = .orphan
        case "oversized": self = .oversized
        case "extended_support": self = .extendedSupport
        case "seat": self = .seat
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .orphan: return "orphan"
        case .oversized: return "oversized"
        case .extendedSupport: return "extended_support"
        case .seat: return "seat"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [SavingsFindingKind] = [
        .orphan,
        .oversized,
        .extendedSupport,
        .seat,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
