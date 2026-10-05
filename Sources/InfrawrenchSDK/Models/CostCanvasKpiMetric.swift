/*
 * InfrawrenchSDK v1.74.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.1).
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
public enum CostCanvasKpiMetric: Codable, Hashable, Sendable {
    public struct CostCanvasKpiMetricObject: Codable, Hashable, Sendable {
        public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case spend
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "spend": self = .spend
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .spend: return "spend"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Type2] = [
                .spend,
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
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
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

        public var type: Type2
        public var dateRange: CostDateRange
        public var filters: [CostReportFilter]?
        public var savedFilterId: String?
        public var costBasis: CostBasis2?
        public var adjusted: Bool?

        public init(
            type: Type2,
            dateRange: CostDateRange,
            filters: [CostReportFilter]? = nil,
            savedFilterId: String? = nil,
            costBasis: CostBasis2? = nil,
            adjusted: Bool? = nil
        ) {
            self.type = type
            self.dateRange = dateRange
            self.filters = filters
            self.savedFilterId = savedFilterId
            self.costBasis = costBasis
            self.adjusted = adjusted
        }
    }

    public struct CostCanvasKpiMetricObject2: Codable, Hashable, Sendable {
        public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case unitCost
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "unit_cost": self = .unitCost
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .unitCost: return "unit_cost"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Type2] = [
                .unitCost,
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
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
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

        public var type: Type2
        /// A business metric id (see /business-metrics).
        public var businessMetricId: String
        public var dateRange: CostDateRange
        public var filters: [CostReportFilter]?
        public var savedFilterId: String?
        public var costBasis: CostBasis2?

        public init(
            type: Type2,
            businessMetricId: String,
            dateRange: CostDateRange,
            filters: [CostReportFilter]? = nil,
            savedFilterId: String? = nil,
            costBasis: CostBasis2? = nil
        ) {
            self.type = type
            self.businessMetricId = businessMetricId
            self.dateRange = dateRange
            self.filters = filters
            self.savedFilterId = savedFilterId
            self.costBasis = costBasis
        }
    }

    public struct CostCanvasKpiMetricObject3: Codable, Hashable, Sendable {
        public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case forecast
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "forecast": self = .forecast
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .forecast: return "forecast"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Type2] = [
                .forecast,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var type: Type2
        public var filters: [CostReportFilter]?
        public var savedFilterId: String?

        public init(
            type: Type2,
            filters: [CostReportFilter]? = nil,
            savedFilterId: String? = nil
        ) {
            self.type = type
            self.filters = filters
            self.savedFilterId = savedFilterId
        }
    }

    public struct CostCanvasKpiMetricObject4: Codable, Hashable, Sendable {
        public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case budget
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "budget": self = .budget
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .budget: return "budget"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Type2] = [
                .budget,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var type: Type2
        public var budgetId: String

        public init(
            type: Type2,
            budgetId: String
        ) {
            self.type = type
            self.budgetId = budgetId
        }
    }

    public struct CostCanvasKpiMetricObject5: Codable, Hashable, Sendable {
        public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case anomalyCount
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "anomaly_count": self = .anomalyCount
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .anomalyCount: return "anomaly_count"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Type2] = [
                .anomalyCount,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var type: Type2
        public var days: Int

        public init(
            type: Type2,
            days: Int
        ) {
            self.type = type
            self.days = days
        }
    }

    case object(CostCanvasKpiMetricObject)
    case object2(CostCanvasKpiMetricObject2)
    case object3(CostCanvasKpiMetricObject3)
    case object4(CostCanvasKpiMetricObject4)
    case object5(CostCanvasKpiMetricObject5)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CostCanvasKpiMetricObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(CostCanvasKpiMetricObject2.self) {
            self = .object2(value)
            return
        }
        if let value = try? container.decode(CostCanvasKpiMetricObject3.self) {
            self = .object3(value)
            return
        }
        if let value = try? container.decode(CostCanvasKpiMetricObject4.self) {
            self = .object4(value)
            return
        }
        if let value = try? container.decode(CostCanvasKpiMetricObject5.self) {
            self = .object5(value)
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
        case .other(let value): try container.encode(value)
        }
    }
}
