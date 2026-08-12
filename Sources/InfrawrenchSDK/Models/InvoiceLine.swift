/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// One scope entry in one collected currency. Two currencies for one cost centre
/// are two lines, not one blended line, because the conversion is a separately
/// reconcilable step.
public struct InvoiceLine: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case costCentre
        case account
        case fixed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "cost_centre": self = .costCentre
            case "account": self = .account
            case "fixed": self = .fixed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .costCentre: return "cost_centre"
            case .account: return "account"
            case .fixed: return "fixed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .costCentre,
            .account,
            .fixed,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var kind: Kind
    /// Cost-centre id, account id, or null for an org-level fixed charge.
    public var refId: String?
    /// The name at issue time, frozen with the numbers — renaming a cost centre
    /// in March must not retitle a line on January's invoice.
    public var label: String
    /// The currency the providers billed in.
    public var currency: String
    /// What the providers charged for this scope, before any billing rule.
    public var collected: Double
    /// What the organisation's billing rules added or removed.
    public var adjustment: Double
    /// `collected + adjustment`.
    public var adjusted: Double
    /// The rate applied to reach `billed`. 1 when the line is already in the
    /// invoice currency; null when the organisation has stated no rate for this
    /// currency, in which case the amount is carried in its own currency rather
    /// than dropped or invented.
    public var rate: Double?
    /// `adjusted × rate`, in the invoice currency.
    public var billed: Double?

    public init(
        kind: Kind,
        refId: String? = nil,
        label: String,
        currency: String,
        collected: Double,
        adjustment: Double,
        adjusted: Double,
        rate: Double? = nil,
        billed: Double? = nil
    ) {
        self.kind = kind
        self.refId = refId
        self.label = label
        self.currency = currency
        self.collected = collected
        self.adjustment = adjustment
        self.adjusted = adjusted
        self.rate = rate
        self.billed = billed
    }
}
