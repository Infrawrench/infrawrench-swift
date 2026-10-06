/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ExtendedSupportFinding: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case endOfLife
        case surcharged
        case unsupported
        case upcoming
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "end-of-life": self = .endOfLife
            case "surcharged": self = .surcharged
            case "unsupported": self = .unsupported
            case "upcoming": self = .upcoming
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .endOfLife: return "end-of-life"
            case .surcharged: return "surcharged"
            case .unsupported: return "unsupported"
            case .upcoming: return "upcoming"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .endOfLife,
            .surcharged,
            .unsupported,
            .upcoming,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Unit: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case clusterHour
        case vcpuHour
        case vcoreHour
        case nodeHour
        case instanceHour
        case acuHour
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "cluster-hour": self = .clusterHour
            case "vcpu-hour": self = .vcpuHour
            case "vcore-hour": self = .vcoreHour
            case "node-hour": self = .nodeHour
            case "instance-hour": self = .instanceHour
            case "acu-hour": self = .acuHour
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .clusterHour: return "cluster-hour"
            case .vcpuHour: return "vcpu-hour"
            case .vcoreHour: return "vcore-hour"
            case .nodeHour: return "node-hour"
            case .instanceHour: return "instance-hour"
            case .acuHour: return "acu-hour"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Unit] = [
            .clusterHour,
            .vcpuHour,
            .vcoreHour,
            .nodeHour,
            .instanceHour,
            .acuHour,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum CostBasis2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case billed
        case billedShare
        case listPrice
        case unpriced
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "billed": self = .billed
            case "billed-share": self = .billedShare
            case "list-price": self = .listPrice
            case "unpriced": self = .unpriced
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .billed: return "billed"
            case .billedShare: return "billed-share"
            case .listPrice: return "list-price"
            case .unpriced: return "unpriced"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [CostBasis2] = [
            .billed,
            .billedShare,
            .listPrice,
            .unpriced,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct NextTier: Codable, Hashable, Sendable {
        public var from: String
        public var label: String
        public var monthlySurcharge: Double?

        public init(
            from: String,
            label: String,
            monthlySurcharge: Double? = nil
        ) {
            self.from = from
            self.label = label
            self.monthlySurcharge = monthlySurcharge
        }
    }

    /// Infrawrench resource id.
    public var resourceId: String
    public var pluginId: PluginId
    public var pluginName: String
    public var resourceTypeId: String
    public var resourceTypeName: String
    public var accountId: String
    public var accountName: String
    public var displayName: String
    public var externalId: String?
    public var region: String?
    /// The matched support-calendar entry, unique within the resource type.
    public var releaseId: String
    public var product: String
    public var engine: String?
    public var currentVersion: String
    public var targetVersion: String
    /// `surcharged`: past standard support and paying for extended support.
    /// `unsupported`: past standard support with no surcharge (no paid extension,
    /// or not enrolled), so a forced upgrade is pending. `end-of-life`: past the
    /// end of extended support too. `upcoming`: standard support ends within the
    /// organization's lead time.
    public var status: Status
    /// Last day of standard support, YYYY-MM-DD.
    public var standardSupportEnds: String
    /// First day the surcharge applies, YYYY-MM-DD.
    public var surchargeStartsOn: String
    /// Zero or negative once it has started.
    public var daysUntilSurcharge: Int
    /// Last day of extended support, after which the provider upgrades it.
    public var extendedSupportEnds: String?
    public var daysUntilForcedUpgrade: Int?
    /// False when there is no paid extension or the resource is not enrolled.
    public var charged: Bool
    /// Billable units (vCPUs, nodes); null when unknown.
    public var quantity: Double?
    public var unit: Unit?
    public var currency: String?
    /// The rate tier in force (or first, if upcoming).
    public var tierLabel: String?
    /// Monthly surcharge an upgrade removes (projected for `upcoming`). Null
    /// means no figure.
    public var monthlySurcharge: Double?
    /// The list-price figure.
    public var listMonthlySurcharge: Double?
    /// Where `monthlySurcharge` came from: `billed` (the provider's billing,
    /// attributable to this resource alone), `billed-share` (a billed line shared
    /// by several matching resources, split by list-price weight), `list-price`
    /// (computed from published rates), or `unpriced` (no figure).
    public var costBasis: CostBasis2
    /// Provider line items behind a billed figure.
    public var billedLineItems: [String]
    /// The next, higher rate tier, when the rate is scheduled to rise.
    public var nextTier: NextTier?
    public var priceNote: String?
    public var pricingUrl: String?
    public var upgradeUrl: String
    public var note: String?

    public init(
        resourceId: String,
        pluginId: PluginId,
        pluginName: String,
        resourceTypeId: String,
        resourceTypeName: String,
        accountId: String,
        accountName: String,
        displayName: String,
        externalId: String? = nil,
        region: String? = nil,
        releaseId: String,
        product: String,
        engine: String? = nil,
        currentVersion: String,
        targetVersion: String,
        status: Status,
        standardSupportEnds: String,
        surchargeStartsOn: String,
        daysUntilSurcharge: Int,
        extendedSupportEnds: String? = nil,
        daysUntilForcedUpgrade: Int? = nil,
        charged: Bool,
        quantity: Double? = nil,
        unit: Unit? = nil,
        currency: String? = nil,
        tierLabel: String? = nil,
        monthlySurcharge: Double? = nil,
        listMonthlySurcharge: Double? = nil,
        costBasis: CostBasis2,
        billedLineItems: [String],
        nextTier: NextTier? = nil,
        priceNote: String? = nil,
        pricingUrl: String? = nil,
        upgradeUrl: String,
        note: String? = nil
    ) {
        self.resourceId = resourceId
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.accountId = accountId
        self.accountName = accountName
        self.displayName = displayName
        self.externalId = externalId
        self.region = region
        self.releaseId = releaseId
        self.product = product
        self.engine = engine
        self.currentVersion = currentVersion
        self.targetVersion = targetVersion
        self.status = status
        self.standardSupportEnds = standardSupportEnds
        self.surchargeStartsOn = surchargeStartsOn
        self.daysUntilSurcharge = daysUntilSurcharge
        self.extendedSupportEnds = extendedSupportEnds
        self.daysUntilForcedUpgrade = daysUntilForcedUpgrade
        self.charged = charged
        self.quantity = quantity
        self.unit = unit
        self.currency = currency
        self.tierLabel = tierLabel
        self.monthlySurcharge = monthlySurcharge
        self.listMonthlySurcharge = listMonthlySurcharge
        self.costBasis = costBasis
        self.billedLineItems = billedLineItems
        self.nextTier = nextTier
        self.priceNote = priceNote
        self.pricingUrl = pricingUrl
        self.upgradeUrl = upgradeUrl
        self.note = note
    }
}
