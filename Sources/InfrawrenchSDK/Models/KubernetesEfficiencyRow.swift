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

public struct KubernetesEfficiencyRow: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case group
        case idle
        case overhead
        case unattributed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "group": self = .group
            case "idle": self = .idle
            case "overhead": self = .overhead
            case "unattributed": self = .unattributed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .group: return "group"
            case .idle: return "idle"
            case .overhead: return "overhead"
            case .unattributed: return "unattributed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .group,
            .idle,
            .overhead,
            .unattributed,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

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

    public var key: String
    public var kind: Kind
    public var label: String
    public var figures: KubernetesEfficiencyFigures
    public var categories: [Category]
    public var points: [Point]

    public init(
        key: String,
        kind: Kind,
        label: String,
        figures: KubernetesEfficiencyFigures,
        categories: [Category],
        points: [Point]
    ) {
        self.key = key
        self.kind = kind
        self.label = label
        self.figures = figures
        self.categories = categories
        self.points = points
    }
}
