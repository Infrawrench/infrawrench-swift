/*
 * InfrawrenchSDK v1.14.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.14.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EfficiencyAlertEvent: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case commitmentExpiry
        case commitmentIdle
        case unitCostRegression
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "commitment_expiry": self = .commitmentExpiry
            case "commitment_idle": self = .commitmentIdle
            case "unit_cost_regression": self = .unitCostRegression
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .commitmentExpiry: return "commitment_expiry"
            case .commitmentIdle: return "commitment_idle"
            case .unitCostRegression: return "unit_cost_regression"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .commitmentExpiry,
            .commitmentIdle,
            .unitCostRegression,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum DetailValue: Codable, Hashable, Sendable {
        case string(String)
        case double(Double)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(String.self) {
                self = .string(value)
                return
            }
            if let value = try? container.decode(Double.self) {
                self = .double(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let value): try container.encode(value)
            case .double(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    public var id: String
    /// Which detector produced it.
    public var kind: Kind
    /// The commitment's description, or the business metric's name.
    public var subject: String
    /// The account, for commitment kinds; null otherwise.
    public var accountId: String?
    public var accountName: String?
    /// ISO 4217 of `amount`, or null when it carries none.
    public var currency: String?
    /// The money at stake, in **units of `currency`** rather than cents —
    /// commitment amounts are provider-reported in currency units. Per kind: the
    /// monthly on-demand exposure for an expiry, the wasted amount for an idle
    /// commitment, the current window's spend for a regression.
    public var amount: Double?
    /// Per-kind display facts. Free-form; nothing branches on it.
    public var detail: [String: DetailValue?]
    public var firedAt: String
    /// When the alert reached its routed destinations, or null when nothing was
    /// routed (or the routing rule held it for quiet hours and the follow-up pass
    /// has not run yet).
    public var notifiedAt: String?

    public init(
        id: String,
        kind: Kind,
        subject: String,
        accountId: String? = nil,
        accountName: String? = nil,
        currency: String? = nil,
        amount: Double? = nil,
        detail: [String: DetailValue?],
        firedAt: String,
        notifiedAt: String? = nil
    ) {
        self.id = id
        self.kind = kind
        self.subject = subject
        self.accountId = accountId
        self.accountName = accountName
        self.currency = currency
        self.amount = amount
        self.detail = detail
        self.firedAt = firedAt
        self.notifiedAt = notifiedAt
    }
}
