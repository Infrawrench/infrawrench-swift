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

public struct CostAccountStatus: Codable, Hashable, Sendable {
    public enum Dimension: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case service
        case region
        case resource
        case tag
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "service": self = .service
            case "region": self = .region
            case "resource": self = .resource
            case "tag": self = .tag
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .service: return "service"
            case .region: return "region"
            case .resource: return "resource"
            case .tag: return "tag"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Dimension] = [
            .service,
            .region,
            .resource,
            .tag,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct CostPollError: Codable, Hashable, Sendable {
        public struct HelpLink: Codable, Hashable, Sendable {
            public var label: String
            public var url: String

            public init(
                label: String,
                url: String
            ) {
                self.label = label
                self.url = url
            }
        }

        public var message: String
        public var helpLink: HelpLink?

        public init(
            message: String,
            helpLink: HelpLink? = nil
        ) {
            self.message = message
            self.helpLink = helpLink
        }
    }

    public struct Coverage: Codable, Hashable, Sendable {
        public var firstDay: String
        public var lastDay: String

        public init(
            firstDay: String,
            lastDay: String
        ) {
            self.firstDay = firstDay
            self.lastDay = lastDay
        }
    }

    public var accountId: String
    public var pluginId: String
    public var displayName: String
    public var supportsCosts: Bool
    public var periodNative: Bool
    public var dimensions: [Dimension]
    /// Whether this account's plugin can tell one kind of charge from another.
    /// False means every row it writes is recorded as `usage` — not that the
    /// provider only bills usage.
    public var chargeTypes: Bool
    /// Whether this account's plugin reports an amortized amount distinct from
    /// the cash amount. Clients offer the amortized cost basis only when at least
    /// one account says yes; elsewhere the amortized view is the cash numbers
    /// under another name.
    public var amortization: Bool
    /// Whether this account's amounts are derived by Infrawrench — inventory
    /// priced against a rate card, or metered usage priced at published list
    /// rates — rather than reported as billed spend. True means the series cannot
    /// be reconciled against an invoice: resources deleted part-way through a
    /// period are no longer in inventory to be priced, all rates are list rather
    /// than negotiated, and credits, tax and refunds never appear.
    public var estimated: Bool
    public var costLastPolledAt: String?
    public var costBackfilledAt: String?
    public var costPollFailureCount: Int
    /// Last cost-collection failure for this account, cleared on the next
    /// success. `helpLink` points at the provider page that fixes a setup problem
    /// when the plugin can identify one (e.g. GCP's billing export console).
    public var costPollError: CostPollError?
    public var coverage: Coverage?

    public init(
        accountId: String,
        pluginId: String,
        displayName: String,
        supportsCosts: Bool,
        periodNative: Bool,
        dimensions: [Dimension],
        chargeTypes: Bool,
        amortization: Bool,
        estimated: Bool,
        costLastPolledAt: String? = nil,
        costBackfilledAt: String? = nil,
        costPollFailureCount: Int,
        costPollError: CostPollError? = nil,
        coverage: Coverage? = nil
    ) {
        self.accountId = accountId
        self.pluginId = pluginId
        self.displayName = displayName
        self.supportsCosts = supportsCosts
        self.periodNative = periodNative
        self.dimensions = dimensions
        self.chargeTypes = chargeTypes
        self.amortization = amortization
        self.estimated = estimated
        self.costLastPolledAt = costLastPolledAt
        self.costBackfilledAt = costBackfilledAt
        self.costPollFailureCount = costPollFailureCount
        self.costPollError = costPollError
        self.coverage = coverage
    }
}
