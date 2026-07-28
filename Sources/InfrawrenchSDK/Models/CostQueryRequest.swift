/*
 * InfrawrenchSDK v0.11.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.11.0).
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
    public var topN: Int?
    public var comparePreviousPeriod: Bool?
    public var forecast: Bool?

    public init(
        from: String,
        to: String,
        binning: Binning,
        groupBy: GroupBy,
        groupByTagKey: String? = nil,
        filters: [CostFilter]? = nil,
        topN: Int? = nil,
        comparePreviousPeriod: Bool? = nil,
        forecast: Bool? = nil
    ) {
        self.from = from
        self.to = to
        self.binning = binning
        self.groupBy = groupBy
        self.groupByTagKey = groupByTagKey
        self.filters = filters
        self.topN = topN
        self.comparePreviousPeriod = comparePreviousPeriod
        self.forecast = forecast
    }
}
