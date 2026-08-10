/*
 * InfrawrenchSDK v1.6.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.6.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostQueryRequest: Codable, Hashable, Sendable {
    public enum Binning: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case daily
        case weekly
        case monthly
        case cumulative
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "daily": self = .daily
            case "weekly": self = .weekly
            case "monthly": self = .monthly
            case "cumulative": self = .cumulative
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .daily: return "daily"
            case .weekly: return "weekly"
            case .monthly: return "monthly"
            case .cumulative: return "cumulative"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Binning] = [
            .daily,
            .weekly,
            .monthly,
            .cumulative,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum GroupBy: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case none
        case provider
        case account
        case service
        case region
        case resource
        case tag
        case chargeType
        case commitment
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "none": self = .none
            case "provider": self = .provider
            case "account": self = .account
            case "service": self = .service
            case "region": self = .region
            case "resource": self = .resource
            case "tag": self = .tag
            case "charge_type": self = .chargeType
            case "commitment": self = .commitment
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .none: return "none"
            case .provider: return "provider"
            case .account: return "account"
            case .service: return "service"
            case .region: return "region"
            case .resource: return "resource"
            case .tag: return "tag"
            case .chargeType: return "charge_type"
            case .commitment: return "commitment"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [GroupBy] = [
            .none,
            .provider,
            .account,
            .service,
            .region,
            .resource,
            .tag,
            .chargeType,
            .commitment,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var from: String
    public var to: String
    public var binning: Binning
    public var groupBy: GroupBy
    public var groupByTagKey: String?
    public var filters: [CostFilter]?
    /// The same filter written as text, in the cost query language — an
    /// alternative to `filters`, compiled server-side into exactly that
    /// structure.
    ///
    /// Grammar: a conjunction of equality terms joined by `AND`. A term is
    /// `dimension = 'value'`, `dimension != 'value'`, `dimension IN ('a','b')` or
    /// `dimension NOT IN ('a','b')`; the tag dimension takes its key in brackets,
    /// `tag['owner'] = 'platform'`. Keywords are case-insensitive, strings may be
    /// single- or double-quoted, and a quote inside a value is escaped by
    /// doubling it (`'it''s'`) or with a backslash (`'it\'s'`).
    ///
    /// `OR` is deliberately not supported: the stored filter is a conjunction, so
    /// several values of one dimension go in an `IN` list and unrelated
    /// alternatives need separate queries. Anything the structured filter cannot
    /// express is a parse error rather than a second execution path.
    ///
    /// Sending both `query` and a non-empty `filters` is a 400, not a precedence
    /// rule. A parse failure is a 400 whose body carries `queryError` with the
    /// character `offset`, the `length` of the offending span, and the `expected`
    /// alternatives there.
    public var query: String?
    /// A saved cost filter (see /saved-cost-filters) applied by reference.
    /// Resolved server-side at query time and AND-composed with whichever of
    /// `filters`/`query` is present — unlike those two it is a composition, not
    /// an alternative. An id that does not resolve to a live filter is a 400; the
    /// query is never silently run unfiltered.
    public var savedFilterId: String?
    public var topN: Int?
    public var comparePreviousPeriod: Bool?
    public var forecast: Bool?
    public var costBasis: CostBasis?
    /// Restrict to these kinds of charge. Omitted is all of them, which is what
    /// makes an unfiltered total net rather than gross — credits, refunds and
    /// commitment discounts are included. Rows collected before charge types
    /// existed, and rows from providers that cannot distinguish them, are
    /// `usage`.
    public var chargeTypes: [CostChargeType]?

    public init(
        from: String,
        to: String,
        binning: Binning,
        groupBy: GroupBy,
        groupByTagKey: String? = nil,
        filters: [CostFilter]? = nil,
        query: String? = nil,
        savedFilterId: String? = nil,
        topN: Int? = nil,
        comparePreviousPeriod: Bool? = nil,
        forecast: Bool? = nil,
        costBasis: CostBasis? = nil,
        chargeTypes: [CostChargeType]? = nil
    ) {
        self.from = from
        self.to = to
        self.binning = binning
        self.groupBy = groupBy
        self.groupByTagKey = groupByTagKey
        self.filters = filters
        self.query = query
        self.savedFilterId = savedFilterId
        self.topN = topN
        self.comparePreviousPeriod = comparePreviousPeriod
        self.forecast = forecast
        self.costBasis = costBasis
        self.chargeTypes = chargeTypes
    }
}
