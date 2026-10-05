/*
 * InfrawrenchSDK v1.57.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.57.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Provider discounts: `commitment_discount` lines and negative
/// `other`/`adjustment` lines (enterprise agreements, private pricing, Savings
/// Plan negation).
public struct DiscountTreatment: Codable, Hashable, Sendable {
    public enum Mode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case passThrough
        case partial
        case retain
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pass_through": self = .passThrough
            case "partial": self = .partial
            case "retain": self = .retain
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .passThrough: return "pass_through"
            case .partial: return "partial"
            case .retain: return "retain"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Mode] = [
            .passThrough,
            .partial,
            .retain,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var mode: Mode
    /// `partial` only: the share the customer receives, strictly between 0 and
    /// 100.
    public var passThroughPercent: Double?

    public init(
        mode: Mode,
        passThroughPercent: Double? = nil
    ) {
        self.mode = mode
        self.passThroughPercent = passThroughPercent
    }
}
