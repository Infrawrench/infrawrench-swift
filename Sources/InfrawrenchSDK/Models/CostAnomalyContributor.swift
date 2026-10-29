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

public struct CostAnomalyContributor: Codable, Hashable, Sendable {
    public enum Facet: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case resource
        case account
        case region
        case usageUnit
        case chargeType
        case tag
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "resource": self = .resource
            case "account": self = .account
            case "region": self = .region
            case "usage_unit": self = .usageUnit
            case "charge_type": self = .chargeType
            case "tag": self = .tag
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .resource: return "resource"
            case .account: return "account"
            case .region: return "region"
            case .usageUnit: return "usage_unit"
            case .chargeType: return "charge_type"
            case .tag: return "tag"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Facet] = [
            .resource,
            .account,
            .region,
            .usageUnit,
            .chargeType,
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

    public struct Resource2: Codable, Hashable, Sendable {
        /// Infrawrench's resource id.
        public var id: String
        public var accountId: String
        public var pluginId: String
        public var resourceTypeId: String
        public var name: String

        public init(
            id: String,
            accountId: String,
            pluginId: String,
            resourceTypeId: String,
            name: String
        ) {
            self.id = id
            self.accountId = accountId
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
            self.name = name
        }
    }

    /// Which breakdown this value belongs to. Each facet partitions the anomaly's
    /// spend, so within a facet the deltas add up to the anomaly's rise.
    public var facet: Facet
    /// The value as cost rows carry it: an account id, a region, the
    /// provider-native resource id, a usage unit, a charge type or a tag value.
    /// Empty for rows with no value and for the folded `other` row.
    public var key: String
    /// The tag key, for the `tag` facet; null otherwise.
    public var tagKey: String?
    /// Display name: the account's or synced resource's name where known, else
    /// `key`.
    public var label: String
    /// The one account this value's spend sits in; null when it spans several.
    public var accountId: String?
    /// The synced inventory resource a `resource` contributor's provider id
    /// matched, for a link to its detail page; null when it was never synced.
    public var resource: Resource2?
    /// Spend on the anomalous day, in cents.
    public var actualCents: Int
    /// Mean daily spend over the same 28-day baseline the detector used, in
    /// cents.
    public var baselineCents: Int
    /// `actualCents - baselineCents`.
    public var deltaCents: Int
    /// `deltaCents` as a share of the anomaly's whole rise (0 to 1; above 1 when
    /// other values fell). Null when the scope did not rise as a whole.
    public var share: Double?
    /// True for the row standing in for contributors outside the caller's cost
    /// visibility scope: their amounts summed, their names withheld.
    public var other: Bool?

    public init(
        facet: Facet,
        key: String,
        tagKey: String? = nil,
        label: String,
        accountId: String? = nil,
        resource: Resource2? = nil,
        actualCents: Int,
        baselineCents: Int,
        deltaCents: Int,
        share: Double? = nil,
        other: Bool? = nil
    ) {
        self.facet = facet
        self.key = key
        self.tagKey = tagKey
        self.label = label
        self.accountId = accountId
        self.resource = resource
        self.actualCents = actualCents
        self.baselineCents = baselineCents
        self.deltaCents = deltaCents
        self.share = share
        self.other = other
    }
}
