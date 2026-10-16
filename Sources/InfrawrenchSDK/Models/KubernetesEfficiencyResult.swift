/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct KubernetesEfficiencyResult: Codable, Hashable, Sendable {
    public enum Granularity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case day
        case week
        case month
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "day": self = .day
            case "week": self = .week
            case "month": self = .month
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .day: return "day"
            case .week: return "week"
            case .month: return "month"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Granularity] = [
            .day,
            .week,
            .month,
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
        case cluster
        case namespace
        case workload
        case label
        case nodePool
        case category
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "cluster": self = .cluster
            case "namespace": self = .namespace
            case "workload": self = .workload
            case "label": self = .label
            case "node_pool": self = .nodePool
            case "category": self = .category
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .cluster: return "cluster"
            case .namespace: return "namespace"
            case .workload: return "workload"
            case .label: return "label"
            case .nodePool: return "node_pool"
            case .category: return "category"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [GroupBy] = [
            .cluster,
            .namespace,
            .workload,
            .label,
            .nodePool,
            .category,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Idle: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case separate
        case spread
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "separate": self = .separate
            case "spread": self = .spread
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .separate: return "separate"
            case .spread: return "spread"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Idle] = [
            .separate,
            .spread,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Basis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case total
        case allocated
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "total": self = .total
            case "allocated": self = .allocated
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .total: return "total"
            case .allocated: return "allocated"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Basis] = [
            .total,
            .allocated,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Currency: Codable, Hashable, Sendable {
        public struct Category: Codable, Hashable, Sendable {
            public var category: KubernetesCostCategory
            public var figures: KubernetesEfficiencyFigures

            public init(
                category: KubernetesCostCategory,
                figures: KubernetesEfficiencyFigures
            ) {
                self.category = category
                self.figures = figures
            }
        }

        public struct Point: Codable, Hashable, Sendable {
            public var bucket: String
            public var total: Double
            /// Capacity measurably used (and mounted volumes, load balancers).
            public var used: Double
            /// Requested but measured unused.
            public var unused: Double
            /// Allocated with no usage data.
            public var unmeasured: Double
            /// Capacity nobody requested, unrequested GPUs, unattached volumes.
            public var idle: Double
            /// System-reserved node capacity and the control-plane fee.
            public var overhead: Double
            /// used + unused + unmeasured.
            public var allocated: Double
            /// 0..1 on the report's basis; null when unmeasured.
            public var efficiency: Double?
            public var measuredShare: Double?

            public init(
                bucket: String,
                total: Double,
                used: Double,
                unused: Double,
                unmeasured: Double,
                idle: Double,
                overhead: Double,
                allocated: Double,
                efficiency: Double? = nil,
                measuredShare: Double? = nil
            ) {
                self.bucket = bucket
                self.total = total
                self.used = used
                self.unused = unused
                self.unmeasured = unmeasured
                self.idle = idle
                self.overhead = overhead
                self.allocated = allocated
                self.efficiency = efficiency
                self.measuredShare = measuredShare
            }
        }

        public var currency: String
        public var totals: KubernetesEfficiencyFigures
        public var categories: [Category]
        public var points: [Point]
        public var rows: [KubernetesEfficiencyRow]

        public init(
            currency: String,
            totals: KubernetesEfficiencyFigures,
            categories: [Category],
            points: [Point],
            rows: [KubernetesEfficiencyRow]
        ) {
            self.currency = currency
            self.totals = totals
            self.categories = categories
            self.points = points
            self.rows = rows
        }
    }

    public var from: String
    public var to: String
    public var granularity: Granularity
    public var groupBy: GroupBy
    public var groupByLabelKey: String?
    public var idle: Idle
    public var basis: Basis
    public var buckets: [String]
    public var currencies: [Currency]
    /// Some rows predate the resource and usage tags (reported as `compute`,
    /// unmeasured).
    public var includesLegacyRows: Bool

    public init(
        from: String,
        to: String,
        granularity: Granularity,
        groupBy: GroupBy,
        groupByLabelKey: String? = nil,
        idle: Idle,
        basis: Basis,
        buckets: [String],
        currencies: [Currency],
        includesLegacyRows: Bool
    ) {
        self.from = from
        self.to = to
        self.granularity = granularity
        self.groupBy = groupBy
        self.groupByLabelKey = groupByLabelKey
        self.idle = idle
        self.basis = basis
        self.buckets = buckets
        self.currencies = currencies
        self.includesLegacyRows = includesLegacyRows
    }
}
