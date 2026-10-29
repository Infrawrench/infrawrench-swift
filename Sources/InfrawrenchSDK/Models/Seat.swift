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

public struct Seat: Codable, Hashable, Sendable {
    public enum Category: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case aiCoding
        case aiAssistant
        case sourceControl
        case identity
        case other
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "ai-coding": self = .aiCoding
            case "ai-assistant": self = .aiAssistant
            case "source-control": self = .sourceControl
            case "identity": self = .identity
            case "other": self = .other
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .aiCoding: return "ai-coding"
            case .aiAssistant: return "ai-assistant"
            case .sourceControl: return "source-control"
            case .identity: return "identity"
            case .other: return "other"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Category] = [
            .aiCoding,
            .aiAssistant,
            .sourceControl,
            .identity,
            .other,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum PriceSource: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case billing
        case catalog
        case configured
        case listPrice
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "billing": self = .billing
            case "catalog": self = .catalog
            case "configured": self = .configured
            case "list-price": self = .listPrice
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .billing: return "billing"
            case .catalog: return "catalog"
            case .configured: return "configured"
            case .listPrice: return "list-price"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [PriceSource] = [
            .billing,
            .catalog,
            .configured,
            .listPrice,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum ActivityBasis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case lastActivity
        case lastLogin
        case usageWindow
        case none
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "last-activity": self = .lastActivity
            case "last-login": self = .lastLogin
            case "usage-window": self = .usageWindow
            case "none": self = .none
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .lastActivity: return "last-activity"
            case .lastLogin: return "last-login"
            case .usageWindow: return "usage-window"
            case .none: return "none"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [ActivityBasis] = [
            .lastActivity,
            .lastLogin,
            .usageWindow,
            .none,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Downgrade: Codable, Hashable, Sendable {
        public var seatType: String
        public var price: SeatPrice
        public var reason: String

        public init(
            seatType: String,
            price: SeatPrice,
            reason: String
        ) {
            self.seatType = seatType
            self.price = price
            self.reason = reason
        }
    }

    public struct Resource2: Codable, Hashable, Sendable {
        public var resourceTypeId: String
        public var externalId: String

        public init(
            resourceTypeId: String,
            externalId: String
        ) {
            self.resourceTypeId = resourceTypeId
            self.externalId = externalId
        }
    }

    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case active
        case inactive
        case new
        case unknown
        case pendingRemoval
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "active": self = .active
            case "inactive": self = .inactive
            case "new": self = .new
            case "unknown": self = .unknown
            case "pending-removal": self = .pendingRemoval
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .active: return "active"
            case .inactive: return "inactive"
            case .new: return "new"
            case .unknown: return "unknown"
            case .pendingRemoval: return "pending-removal"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .active,
            .inactive,
            .new,
            .unknown,
            .pendingRemoval,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Infrawrench seat id; the handle for removal.
    public var id: String
    public var accountId: String
    public var accountName: String
    public var pluginId: PluginId
    public var pluginName: String
    /// Provider-native member id.
    public var memberId: String
    /// Empty unless one member holds several seats on the account.
    public var seatKey: String
    public var name: String?
    public var email: String?
    public var login: String?
    public var product: String
    /// What the seat is for. Two seats one person holds in the same category on
    /// different products are a duplicate finding; `other` never is.
    public var category: Category
    public var seatType: String
    /// Per month; null when unpriced.
    public var monthlyPrice: Double?
    public var currency: String?
    /// `billing`/`catalog`: read from the provider. `configured`: the price set
    /// on the account. `list-price`: the provider's published list price, an
    /// estimate.
    public var priceSource: PriceSource?
    public var priceNote: String?
    /// How the provider evidences use: `last-activity` (last use of the product),
    /// `last-login` (last sign-in), `usage-window` (per-day usage over
    /// `activityWindowDays`), or `none` (no evidence; never flagged inactive).
    public var activityBasis: ActivityBasis
    public var lastActiveAt: String?
    public var activityWindowDays: Int?
    /// Plain-English description of the evidence.
    public var activitySource: String
    public var assignedAt: String?
    public var pendingRemovalOn: String?
    /// Whether the in-app Remove can remove it.
    public var removable: Bool
    public var removalNote: String?
    public var downgrade: Downgrade?
    public var context: [String: String]
    public var resource: Resource2?
    public var lastSeenAt: String
    /// `inactive`: the evidence covers the threshold and shows no use. `new`:
    /// assigned inside the threshold and not used yet. `unknown`: the evidence
    /// cannot cover the threshold. `pending-removal`: already being removed at
    /// the provider.
    public var status: Status
    public var daysInactive: Int?
    public var neverActive: Bool

    public init(
        id: String,
        accountId: String,
        accountName: String,
        pluginId: PluginId,
        pluginName: String,
        memberId: String,
        seatKey: String,
        name: String? = nil,
        email: String? = nil,
        login: String? = nil,
        product: String,
        category: Category,
        seatType: String,
        monthlyPrice: Double? = nil,
        currency: String? = nil,
        priceSource: PriceSource? = nil,
        priceNote: String? = nil,
        activityBasis: ActivityBasis,
        lastActiveAt: String? = nil,
        activityWindowDays: Int? = nil,
        activitySource: String,
        assignedAt: String? = nil,
        pendingRemovalOn: String? = nil,
        removable: Bool,
        removalNote: String? = nil,
        downgrade: Downgrade? = nil,
        context: [String: String],
        resource: Resource2? = nil,
        lastSeenAt: String,
        status: Status,
        daysInactive: Int? = nil,
        neverActive: Bool
    ) {
        self.id = id
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.memberId = memberId
        self.seatKey = seatKey
        self.name = name
        self.email = email
        self.login = login
        self.product = product
        self.category = category
        self.seatType = seatType
        self.monthlyPrice = monthlyPrice
        self.currency = currency
        self.priceSource = priceSource
        self.priceNote = priceNote
        self.activityBasis = activityBasis
        self.lastActiveAt = lastActiveAt
        self.activityWindowDays = activityWindowDays
        self.activitySource = activitySource
        self.assignedAt = assignedAt
        self.pendingRemovalOn = pendingRemovalOn
        self.removable = removable
        self.removalNote = removalNote
        self.downgrade = downgrade
        self.context = context
        self.resource = resource
        self.lastSeenAt = lastSeenAt
        self.status = status
        self.daysInactive = daysInactive
        self.neverActive = neverActive
    }
}
