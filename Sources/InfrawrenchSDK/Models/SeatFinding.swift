/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SeatFinding: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case inactive
        case duplicate
        case downgrade
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "inactive": self = .inactive
            case "duplicate": self = .duplicate
            case "downgrade": self = .downgrade
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .inactive: return "inactive"
            case .duplicate: return "duplicate"
            case .downgrade: return "downgrade"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .inactive,
            .duplicate,
            .downgrade,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Duplicate: Codable, Hashable, Sendable {
        public var keptSeatId: String
        public var keptProduct: String
        public var keptAccountName: String
        public var keptLastActiveAt: String?

        public init(
            keptSeatId: String,
            keptProduct: String,
            keptAccountName: String,
            keptLastActiveAt: String? = nil
        ) {
            self.keptSeatId = keptSeatId
            self.keptProduct = keptProduct
            self.keptAccountName = keptAccountName
            self.keptLastActiveAt = keptLastActiveAt
        }
    }

    public var kind: Kind
    public var seatId: String
    public var monthlySaving: Double?
    public var currency: String?
    /// For a duplicate: the seat kept (the one used most recently).
    public var duplicate: Duplicate?
    public var targetSeatType: String?
    public var reason: String?
    public var remediation: FindingRemediation?

    public init(
        kind: Kind,
        seatId: String,
        monthlySaving: Double? = nil,
        currency: String? = nil,
        duplicate: Duplicate? = nil,
        targetSeatType: String? = nil,
        reason: String? = nil,
        remediation: FindingRemediation? = nil
    ) {
        self.kind = kind
        self.seatId = seatId
        self.monthlySaving = monthlySaving
        self.currency = currency
        self.duplicate = duplicate
        self.targetSeatType = targetSeatType
        self.reason = reason
        self.remediation = remediation
    }
}
