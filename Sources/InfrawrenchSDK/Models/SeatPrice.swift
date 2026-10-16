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

public struct SeatPrice: Codable, Hashable, Sendable {
    public enum Source: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case billing
        case catalog
        case configured
        case listPrice
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "billing": self = .billing
            case "catalog": self = .catalog
            case "configured": self = .configured
            case "list-price": self = .listPrice
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .billing: return "billing"
            case .catalog: return "catalog"
            case .configured: return "configured"
            case .listPrice: return "list-price"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Source] = [
            .billing,
            .catalog,
            .configured,
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

    public var monthly: Double
    public var currency: String
    /// `billing`/`catalog`: read from the provider. `configured`: the price set
    /// on the account. `list-price`: the provider's published list price, an
    /// estimate.
    public var source: Source
    public var note: String?

    public init(
        monthly: Double,
        currency: String,
        source: Source,
        note: String? = nil
    ) {
        self.monthly = monthly
        self.currency = currency
        self.source = source
        self.note = note
    }
}
