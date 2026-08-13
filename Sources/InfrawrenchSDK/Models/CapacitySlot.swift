/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CapacitySlot: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case active
        case refunded
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "active": self = .active
            case "refunded": self = .refunded
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .active: return "active"
            case .refunded: return "refunded"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .active,
            .refunded,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var id: String
    /// Seats this purchase grants for the whole of its term.
    public var quantity: Int
    /// A slot is only granting capacity when it is `active` AND `expiresAt` is
    /// still in the future.
    public var status: Status
    public var startsAt: String
    public var expiresAt: String
    public var termMonths: Int
    public var amountPaidCents: Int?

    public init(
        id: String,
        quantity: Int,
        status: Status,
        startsAt: String,
        expiresAt: String,
        termMonths: Int,
        amountPaidCents: Int? = nil
    ) {
        self.id = id
        self.quantity = quantity
        self.status = status
        self.startsAt = startsAt
        self.expiresAt = expiresAt
        self.termMonths = termMonths
        self.amountPaidCents = amountPaidCents
    }
}
