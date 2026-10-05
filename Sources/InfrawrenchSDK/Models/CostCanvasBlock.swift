/*
 * InfrawrenchSDK v1.57.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.57.0).
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

        /// Stable within the spec; text blocks reference KPI ids as `{{id}}`.
        public var id: String
        public var kind: Kind
        public var title: String
        public var config: JsonObject

        public init(
            id: String,
            kind: Kind,
            title: String,
            config: JsonObject
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
