/*
 * InfrawrenchSDK v1.71.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.71.0).
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
        case donut
        case table
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
            case "donut": self = .donut
            case "table": self = .table
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
            case .donut: return "donut"
            case .table: return "table"
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
            .donut,
            .table,
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
        case virtualTag
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
            case "virtual_tag": self = .virtualTag
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
            case .virtualTag: return "virtual_tag"
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
            .virtualTag,
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
        case blended
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "cash": self = .cash
            case "amortized": self = .amortized
            case "blended": self = .blended
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .cash: return "cash"
            case .amortized: return "amortized"
            case .blended: return "blended"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [CostBasis2] = [
            .cash,
            .amortized,
            .blended,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum UnitCostMode2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case unitCost
        case margin
        case usageUnitCost
        case rawMetric
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "unit_cost": self = .unitCost
            case "margin": self = .margin
            case "usage_unit_cost": self = .usageUnitCost
            case "raw_metric": self = .rawMetric
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .unitCost: return "unit_cost"
            case .margin: return "margin"
            case .usageUnitCost: return "usage_unit_cost"
            case .rawMetric: return "raw_metric"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [UnitCostMode2] = [
            .unitCost,
            .margin,
            .usageUnitCost,
            .rawMetric,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct UnitCostLabelFilter2: Codable, Hashable, Sendable {
        public enum Op: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case `in`
            case notIn
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "in": self = .`in`
                case "not_in": self = .notIn
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .`in`: return "in"
                case .notIn: return "not_in"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Op] = [
                .`in`,
                .notIn,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var key: String
        public var op: Op
        public var values: [String]

        public init(
            key: String,
            op: Op,
            values: [String]
        ) {
            self.key = key
            self.op = op
            self.values = values
        }
    }

    public var version: Double
    /// How the series are drawn. `pie` and `donut` draw period totals per group;
    /// `table` lists every bucket as a row with a column per series and a total.
    public var chartType: ChartType
    public var binning: CostBinning
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
    public var measure: CostMeasure?
    /// The usage unit a `usage` measure sums, exactly as the provider spells it
    /// (`Hrs`, `GB-Mo`). List them with GET
    /// /costs/dimensions?dimension=usage-units. Required for `usage`, refused for
    /// any other measure.
    public var usageUnit: String?
    /// Running totals from the start of the range, at any bin size. Omitted is
    /// off. Totals then report the last point rather than the sum.
    public var cumulative: Bool?
    /// Divide spend by this business metric (an id, so a key rename never
    /// re-points the graph).
    public var unitCostMetricId: String?
    /// The calculation. `usage_unit_cost` needs `unitCostUsageUnit` instead of a
    /// metric; the others need `unitCostMetricId`.
    public var unitCostMode: UnitCostMode2?
    /// "Per N units" for a ratio, or the unit a raw metric is shown in. Absent is
    /// 1.
    public var unitCostScale: Double?
    /// `usage_unit_cost` only: the provider usage unit to divide by.
    public var unitCostUsageUnit: String?
    /// Keep only metric values carrying these labels.
    public var unitCostLabelFilters: [UnitCostLabelFilter2]?
    /// One line per value of this metric label.
    public var unitCostGroupByLabel: String?
    /// Draw the org's billing rules applied.
    public var adjusted: Bool?

    public init(
        version: Double,
        chartType: ChartType,
        binning: CostBinning,
        dateRange: CostDateRange,
        groupBy: GroupBy,
        groupByTagKey: String? = nil,
        filters: [CostReportFilter]? = nil,
        savedFilterId: String? = nil,
        topN: Int? = nil,
        comparePreviousPeriod: Bool? = nil,
        showForecast: Bool? = nil,
        scenarioModelId: String? = nil,
        costBasis: CostBasis2? = nil,
        measure: CostMeasure? = nil,
        usageUnit: String? = nil,
        cumulative: Bool? = nil,
        unitCostMetricId: String? = nil,
        unitCostMode: UnitCostMode2? = nil,
        unitCostScale: Double? = nil,
        unitCostUsageUnit: String? = nil,
        unitCostLabelFilters: [UnitCostLabelFilter2]? = nil,
        unitCostGroupByLabel: String? = nil,
        adjusted: Bool? = nil
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
        self.measure = measure
        self.usageUnit = usageUnit
        self.cumulative = cumulative
        self.unitCostMetricId = unitCostMetricId
        self.unitCostMode = unitCostMode
        self.unitCostScale = unitCostScale
        self.unitCostUsageUnit = unitCostUsageUnit
        self.unitCostLabelFilters = unitCostLabelFilters
        self.unitCostGroupByLabel = unitCostGroupByLabel
        self.adjusted = adjusted
    }
}
