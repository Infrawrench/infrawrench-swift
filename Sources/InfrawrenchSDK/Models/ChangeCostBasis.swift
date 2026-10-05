/*
 * InfrawrenchSDK v1.68.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.68.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Which charge-type basis both windows are read on. `cash` (the default) is what
/// the provider charged on the day it charged it; `amortized` spreads a
/// commitment's up-front fee across the term it buys; `blended` also spreads each
/// commitment's discount evenly over the usage it could cover. It is echoed on
/// every response because a delta whose basis is unstated is unreadable — an
/// amortized 'after' against a cash 'before' looks exactly like a saving.
public enum ChangeCostBasis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case cash
    case amortized
    case blended
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "cash": self = .cash
        case "amortized": self = .amortized
        case "blended": self = .blended
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .cash: return "cash"
        case .amortized: return "amortized"
        case .blended: return "blended"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [ChangeCostBasis] = [
        .cash,
        .amortized,
        .blended,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
