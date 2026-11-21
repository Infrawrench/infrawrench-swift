/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MigrationCost: Codable, Hashable, Sendable {
    public enum Basis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case billed
        case estimate
        case listPrice
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "billed": self = .billed
            case "estimate": self = .estimate
            case "list-price": self = .listPrice
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .billed: return "billed"
            case .estimate: return "estimate"
            case .listPrice: return "list-price"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Basis] = [
            .billed,
            .estimate,
            .listPrice,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Per month (730 hours).
    public var amount: Double
    public var currency: String
    /// `billed`: the resource's own spend in collected cost data over the last 30
    /// days, scaled to 730 hours. `estimate`: the plugin's estimate for the
    /// configuration. `list-price`: the size's published list price times the
    /// count.
    public var basis: Basis
    /// Only part of the resource could be priced; the true figure is higher.
    public var partial: Bool

    public init(
        amount: Double,
        currency: String,
        basis: Basis,
        partial: Bool
    ) {
        self.amount = amount
        self.currency = currency
        self.basis = basis
        self.partial = partial
    }
}
