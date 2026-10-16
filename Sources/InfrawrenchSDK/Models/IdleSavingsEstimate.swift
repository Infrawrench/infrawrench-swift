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

/// Monthly figure at the provider's published list price, for idle rows a plugin
/// could price. An estimate: show it only when `cost` (billed spend) is null.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct IdleSavingsEstimate: Codable, Hashable, Sendable {
    public enum Basis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case listPrice
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "list-price": self = .listPrice
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .listPrice: return "list-price"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Basis] = [
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

    /// Monthly figure at the provider's published rate.
    public var monthlyAmount: Double
    public var currency: String
    public var basis: Basis
    /// Caveat shown beside the figure.
    public var note: String?

    public init(
        monthlyAmount: Double,
        currency: String,
        basis: Basis,
        note: String? = nil
    ) {
        self.monthlyAmount = monthlyAmount
        self.currency = currency
        self.basis = basis
        self.note = note
    }
}
