/*
 * InfrawrenchSDK v1.101.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.101.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum CostCanvasBlock: Codable, Hashable, Sendable {
    public struct CostCanvasBlockObject: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case text
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "text": self = .text
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .text: return "text"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .text,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// Stable within the spec; text blocks reference KPI ids as `{{id}}`.
        public var id: String
        public var kind: Kind
        /// Short narrative; `{{kpiId}}` / `{{kpiId.change}}` render that KPI's
        /// figure.
        public var text: String

        public init(
            id: String,
            kind: Kind,
            text: String
        ) {
            self.id = id
            self.kind = kind
            self.text = text
        }
    }

    public struct CostCanvasBlockObject2: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case kpi
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "kpi": self = .kpi
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .kpi: return "kpi"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .kpi,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// Stable within the spec; text blocks reference KPI ids as `{{id}}`.
        public var id: String
        public var kind: Kind
        public var title: String
        public var metric: CostCanvasKpiMetric
        public var comparePreviousPeriod: Bool?

        public init(
            id: String,
            kind: Kind,
            title: String,
            metric: CostCanvasKpiMetric,
            comparePreviousPeriod: Bool? = nil
        ) {
            self.id = id
            self.kind = kind
            self.title = title
            self.metric = metric
            self.comparePreviousPeriod = comparePreviousPeriod
        }
    }

    public struct CostCanvasBlockObject3: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case chart
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "chart": self = .chart
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .chart: return "chart"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .chart,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public struct Config: Codable, Hashable, Sendable {
            public enum ChartType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                case stackedBar
                case multiBar
                case line
                case area
                case pie
                case donut
                case table
                /// A value the API added after this SDK was generated. Kept
                /// rather than rejected, so a new server-side value cannot break
                /// decoding.
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
                /// A value the API added after this SDK was generated. Kept
                /// rather than rejected, so a new server-side value cannot break
                /// decoding.
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
                /// A value the API added after this SDK was generated. Kept
                /// rather than rejected, so a new server-side value cannot break
                /// decoding.
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

            public enum ComparisonStyle: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                case line
                case bars
                /// A value the API added after this SDK was generated. Kept
                /// rather than rejected, so a new server-side value cannot break
                /// decoding.
                case unrecognized(String)

                public init(rawValue: String) {
                    switch rawValue {
                    case "line": self = .line
                    case "bars": self = .bars
                    default: self = .unrecognized(rawValue)
                    }
                }

                public var rawValue: String {
                    switch self {
                    case .line: return "line"
                    case .bars: return "bars"
                    case .unrecognized(let value): return value
                    }
                }

                /// Every value the spec declares. `unrecognized` is deliberately absent.
                public static let allKnownCases: [ComparisonStyle] = [
                    .line,
                    .bars,
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
            /// How the series are drawn. `pie` and `donut` draw period totals per
            /// group; `table` lists every bucket as a row with a column per
            /// series and a total.
            public var chartType: ChartType
            public var binning: CostBinning
            public var dateRange: CostDateRange
            public var groupBy: GroupBy
            public var groupByTagKey: String?
            public var filters: [CostReportFilter]?
            /// A saved cost filter (see /saved-cost-filters) applied by reference
            /// and AND-composed with `filters` at query time, server-side.
            /// Editing the saved filter changes every graph, report and budget
            /// referencing it; a reference that fails to resolve makes the query
            /// error rather than silently run unfiltered.
            public var savedFilterId: String?
            public var topN: Int?
            public var comparePreviousPeriod: Bool?
            public var showForecast: Bool?
            /// A scenario model (see /cost-scenarios) overlaid on the forecast;
            /// known future cost the trend cannot see, drawn as a second dashed
            /// line beside the trend rather than instead of it. Only meaningful
            /// alongside `showForecast`.
            public var scenarioModelId: String?
            public var costBasis: CostBasis2?
            /// Divide spend by this business metric (an id, so a key rename never
            /// re-points the graph).
            public var unitCostMetricId: String?
            public var unitCostMode: UnitCostMode?
            /// "Per N units" for a ratio, or the unit a raw metric is shown in.
            /// Absent is 1.
            public var unitCostScale: Double?
            /// `usage_unit_cost` only: the provider usage unit to divide by.
            public var unitCostUsageUnit: String?
            /// Keep only metric values carrying these labels.
            public var unitCostLabelFilters: [UnitCostLabelFilter]?
            /// One line per value of this metric label.
            public var unitCostGroupByLabel: String?
            /// Draw the org's billing rules applied.
            public var adjusted: Bool?
            public var measure: CostMeasure?
            /// The usage unit a `usage` measure sums, exactly as the provider
            /// spells it (`Hrs`, `GB-Mo`). List them with GET
            /// /costs/dimensions?dimension=usage-units. Required for `usage`,
            /// refused for any other measure.
            public var usageUnit: String?
            /// Running totals from the start of the range, at any bin size.
            /// Omitted is off. Totals then report the last point rather than the
            /// sum.
            public var cumulative: Bool?
            /// Put this dimension's values on the X axis instead of date bins:
            /// one bar per value, ranked by spend over the range, the top `topN`
            /// then `__other__`. `groupBy` then segments each bar (or set
            /// `segmentByDate` to segment by bin instead). Omitted is the date
            /// axis. Refused with a forecast, a scenario, a running total, the
            /// `count` measure or a unit-cost chart, which all need dates.
            public var xAxis: CostDimension?
            /// Required when `xAxis` is `tag` or `virtual_tag`: which key's
            /// values go on the axis.
            public var xAxisTagKey: String?
            /// With `xAxis` and `groupBy: none`: segment each bar by date bin
            /// (one series per bin). Refused alongside a `groupBy`; ignored
            /// without `xAxis`.
            public var segmentByDate: Bool?
            /// How `comparePreviousPeriod` is drawn: `line` (omitted) is the
            /// dashed totals line, `bars` a previous-period bar beside each bar
            /// (bar charts only). Tables always list previous, change and change
            /// % columns.
            public var comparisonStyle: ComparisonStyle?

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
                unitCostMetricId: String? = nil,
                unitCostMode: UnitCostMode? = nil,
                unitCostScale: Double? = nil,
                unitCostUsageUnit: String? = nil,
                unitCostLabelFilters: [UnitCostLabelFilter]? = nil,
                unitCostGroupByLabel: String? = nil,
                adjusted: Bool? = nil,
                measure: CostMeasure? = nil,
                usageUnit: String? = nil,
                cumulative: Bool? = nil,
                xAxis: CostDimension? = nil,
                xAxisTagKey: String? = nil,
                segmentByDate: Bool? = nil,
                comparisonStyle: ComparisonStyle? = nil
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
                self.unitCostMetricId = unitCostMetricId
                self.unitCostMode = unitCostMode
                self.unitCostScale = unitCostScale
                self.unitCostUsageUnit = unitCostUsageUnit
                self.unitCostLabelFilters = unitCostLabelFilters
                self.unitCostGroupByLabel = unitCostGroupByLabel
                self.adjusted = adjusted
                self.measure = measure
                self.usageUnit = usageUnit
                self.cumulative = cumulative
                self.xAxis = xAxis
                self.xAxisTagKey = xAxisTagKey
                self.segmentByDate = segmentByDate
                self.comparisonStyle = comparisonStyle
            }
        }

        /// Stable within the spec; text blocks reference KPI ids as `{{id}}`.
        public var id: String
        public var kind: Kind
        public var title: String
        public var config: Config

        public init(
            id: String,
            kind: Kind,
            title: String,
            config: Config
        ) {
            self.id = id
            self.kind = kind
            self.title = title
            self.config = config
        }
    }

    public struct CostCanvasBlockObject4: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case table
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "table": self = .table
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .table: return "table"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
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

        /// Stable within the spec; text blocks reference KPI ids as `{{id}}`.
        public var id: String
        public var kind: Kind
        public var title: String
        public var query: CostCanvasTableQuery

        public init(
            id: String,
            kind: Kind,
            title: String,
            query: CostCanvasTableQuery
        ) {
            self.id = id
            self.kind = kind
            self.title = title
            self.query = query
        }
    }

    public struct CostCanvasBlockObject5: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case budgets
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "budgets": self = .budgets
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .budgets: return "budgets"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .budgets,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// Stable within the spec; text blocks reference KPI ids as `{{id}}`.
        public var id: String
        public var kind: Kind
        public var title: String
        public var budgetIds: [String]?

        public init(
            id: String,
            kind: Kind,
            title: String,
            budgetIds: [String]? = nil
        ) {
            self.id = id
            self.kind = kind
            self.title = title
            self.budgetIds = budgetIds
        }
    }

    public struct CostCanvasBlockObject6: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case anomalies
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "anomalies": self = .anomalies
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .anomalies: return "anomalies"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .anomalies,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// Stable within the spec; text blocks reference KPI ids as `{{id}}`.
        public var id: String
        public var kind: Kind
        public var title: String
        public var days: Int?
        public var limit: Int?

        public init(
            id: String,
            kind: Kind,
            title: String,
            days: Int? = nil,
            limit: Int? = nil
        ) {
            self.id = id
            self.kind = kind
            self.title = title
            self.days = days
            self.limit = limit
        }
    }

    public struct CostCanvasBlockObject7: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case costReport
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "cost_report": self = .costReport
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .costReport: return "cost_report"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .costReport,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// Stable within the spec; text blocks reference KPI ids as `{{id}}`.
        public var id: String
        public var kind: Kind
        public var title: String?
        public var reportId: String

        public init(
            id: String,
            kind: Kind,
            title: String? = nil,
            reportId: String
        ) {
            self.id = id
            self.kind = kind
            self.title = title
            self.reportId = reportId
        }
    }

    public struct CostCanvasBlockObject8: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case customGraph
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "custom_graph": self = .customGraph
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .customGraph: return "custom_graph"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .customGraph,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// Stable within the spec; text blocks reference KPI ids as `{{id}}`.
        public var id: String
        public var kind: Kind
        public var title: String?
        public var graphId: String

        public init(
            id: String,
            kind: Kind,
            title: String? = nil,
            graphId: String
        ) {
            self.id = id
            self.kind = kind
            self.title = title
            self.graphId = graphId
        }
    }

    case object(CostCanvasBlockObject)
    case object2(CostCanvasBlockObject2)
    case object3(CostCanvasBlockObject3)
    case object4(CostCanvasBlockObject4)
    case object5(CostCanvasBlockObject5)
    case object6(CostCanvasBlockObject6)
    case object7(CostCanvasBlockObject7)
    case object8(CostCanvasBlockObject8)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CostCanvasBlockObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(CostCanvasBlockObject2.self) {
            self = .object2(value)
            return
        }
        if let value = try? container.decode(CostCanvasBlockObject3.self) {
            self = .object3(value)
            return
        }
        if let value = try? container.decode(CostCanvasBlockObject4.self) {
            self = .object4(value)
            return
        }
        if let value = try? container.decode(CostCanvasBlockObject5.self) {
            self = .object5(value)
            return
        }
        if let value = try? container.decode(CostCanvasBlockObject6.self) {
            self = .object6(value)
            return
        }
        if let value = try? container.decode(CostCanvasBlockObject7.self) {
            self = .object7(value)
            return
        }
        if let value = try? container.decode(CostCanvasBlockObject8.self) {
            self = .object8(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .object3(let value): try container.encode(value)
        case .object4(let value): try container.encode(value)
        case .object5(let value): try container.encode(value)
        case .object6(let value): try container.encode(value)
        case .object7(let value): try container.encode(value)
        case .object8(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
