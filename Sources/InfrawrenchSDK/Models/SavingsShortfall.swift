/*
 * InfrawrenchSDK v1.74.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct SavingsShortfall: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case belowProjection
        case grewBack
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "below_projection": self = .belowProjection
            case "grew_back": self = .grewBack
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .belowProjection: return "below_projection"
            case .grewBack: return "grew_back"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .belowProjection,
            .grewBack,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// `below_projection` — the trailing realized rate is under the org's
    /// threshold share of the projected rate; `grew_back` — post-action spend is
    /// above the pre-action baseline.
    public var kind: Kind
    /// Currency units (not cents), in the row's currency.
    public var realizedPerDay: Double
    /// Currency units (not cents), in the row's currency.
    public var projectedPerDay: Double?

    public init(
        kind: Kind,
        realizedPerDay: Double,
        projectedPerDay: Double? = nil
    ) {
        self.kind = kind
        self.realizedPerDay = realizedPerDay
        self.projectedPerDay = projectedPerDay
    }
}
