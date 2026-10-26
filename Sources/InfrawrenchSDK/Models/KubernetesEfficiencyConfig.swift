/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct KubernetesEfficiencyConfig: Codable, Hashable, Sendable {
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

    public var version: Double
    public var dateRange: CostDateRange
    public var granularity: Granularity
    public var filters: [KubernetesEfficiencyFilter]
    public var groupBy: GroupBy
    /// The tag key to group by; required exactly when `groupBy` is `label`.
    public var groupByLabelKey: String?
    /// Cost categories to include. Absent or empty is every category.
    public var categories: [KubernetesCostCategory]?
    /// `separate` keeps idle capacity and cluster overhead as their own rows;
    /// `spread` shares them across each cluster's groups, per period, in
    /// proportion to what each was allocated.
    public var idle: Idle
    /// Efficiency denominator. `total`: used / (total - unmeasured), so idle and
    /// overhead count against it. `allocated`: used / (used + unused), what
    /// workloads reserved only.
    public var basis: Basis

    public init(
        version: Double,
        dateRange: CostDateRange,
        granularity: Granularity,
        filters: [KubernetesEfficiencyFilter],
        groupBy: GroupBy,
        groupByLabelKey: String? = nil,
        categories: [KubernetesCostCategory]? = nil,
        idle: Idle,
        basis: Basis
    ) {
        self.version = version
        self.dateRange = dateRange
        self.granularity = granularity
        self.filters = filters
        self.groupBy = groupBy
        self.groupByLabelKey = groupByLabelKey
        self.categories = categories
        self.idle = idle
        self.basis = basis
    }
}
