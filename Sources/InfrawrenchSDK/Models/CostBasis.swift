/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Which number to sum. `cash` is what the provider charged on the day it charged
/// it — the default, and what every query returned before this existed.
/// `amortized` spreads a commitment's up-front fee across the term it buys, so a
/// year of capacity bought on one day is counted on the days it covers. Providers
/// that report no amortized amount fall back to their cash amount, so an
/// amortized query over a mixed estate never drops their spend.
public enum CostBasis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case cash
    case amortized
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "cash": self = .cash
        case "amortized": self = .amortized
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .cash: return "cash"
        case .amortized: return "amortized"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [CostBasis] = [
        .cash,
        .amortized,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
