/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The saved graph. Identical to the config an ad-hoc `cost_graph` dashboard
/// widget stores inline — a report is that config given a name and an id.
public struct CostGraphConfig: Codable, Hashable, Sendable {
    public enum ChartType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case stackedBar
        case multiBar
        case line
        case area
        case pie
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "stacked_bar": self = .stackedBar
            case "multi_bar": self = .multiBar
            case "line": self = .line
            case "area": self = .area
            case "pie": self = .pie
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .stackedBar: return "stacked_bar"
            case .multiBar: return "multi_bar"
            case .line: return "line"
            case .area: return "area"
            case .pie: return "pie"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [ChartType] = [
            .stackedBar,
            .multiBar,
            .line,
            .area,
            .pie,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

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

    public enum CostBasis2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case cash
        case amortized
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "cash": self = .cash
            case "amortized": self = .amortized
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .cash: return "cash"
            case .amortized: return "amortized"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [CostBasis2] = [
            .cash,
            .amortized,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var version: Double
    public var chartType: ChartType
    public var binning: Binning
    public var dateRange: CostDateRange
    public var groupBy: GroupBy
    public var groupByTagKey: String?
    public var filters: [CostReportFilter]?
    /// A saved cost filter (see /saved-cost-filters) applied by reference and
    /// AND-composed with `filters` at query time, server-side. Editing the saved
    /// filter changes every graph, report and budget referencing it; a reference
    /// that fails to resolve makes the query error rather than silently run
    /// unfiltered.
    public var savedFilterId: String?
    public var topN: Int?
    public var comparePreviousPeriod: Bool?
    public var showForecast: Bool?
    /// A scenario model (see /cost-scenarios) overlaid on the forecast — known
    /// future cost the trend cannot see, drawn as a second dashed line beside the
    /// trend rather than instead of it. Only meaningful alongside `showForecast`.
    public var scenarioModelId: String?
    public var costBasis: CostBasis2?

    public init(
        version: Double,
        chartType: ChartType,
        binning: Binning,
        dateRange: CostDateRange,
        groupBy: GroupBy,
        groupByTagKey: String? = nil,
        filters: [CostReportFilter]? = nil,
        savedFilterId: String? = nil,
        topN: Int? = nil,
        comparePreviousPeriod: Bool? = nil,
        showForecast: Bool? = nil,
        scenarioModelId: String? = nil,
        costBasis: CostBasis2? = nil
    ) {
        self.version = version
        self.chartType = chartType
        self.binning = binning
        self.dateRange = dateRange
        self.groupBy = groupBy
        self.groupByTagKey = groupByTagKey
        self.filters = filters
        self.savedFilterId = savedFilterId
        self.topN = topN
        self.comparePreviousPeriod = comparePreviousPeriod
        self.showForecast = showForecast
        self.scenarioModelId = scenarioModelId
        self.costBasis = costBasis
    }
}
