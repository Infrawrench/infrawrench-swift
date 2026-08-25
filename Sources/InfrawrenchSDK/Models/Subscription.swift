/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
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
public struct Subscription: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case trialing
        case active
        case pastDue
        case canceled
        case unpaid
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "trialing": self = .trialing
            case "active": self = .active
            case "past_due": self = .pastDue
            case "canceled": self = .canceled
            case "unpaid": self = .unpaid
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .trialing: return "trialing"
            case .active: return "active"
            case .pastDue: return "past_due"
            case .canceled: return "canceled"
            case .unpaid: return "unpaid"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .trialing,
            .active,
            .pastDue,
            .canceled,
            .unpaid,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var status: Status
    public var seatCount: Int
    public var currentPeriodEnd: String?
    public var stripeCustomerId: String

    public init(
        status: Status,
        seatCount: Int,
        currentPeriodEnd: String? = nil,
        stripeCustomerId: String
    ) {
        self.status = status
        self.seatCount = seatCount
        self.currentPeriodEnd = currentPeriodEnd
        self.stripeCustomerId = stripeCustomerId
    }
}
