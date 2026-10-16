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

public struct CostExportJobRequest: Codable, Hashable, Sendable {
    public struct Query: Codable, Hashable, Sendable {
        public enum Dimension: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case provider
            case account
            case service
            case region
            case resource
            case chargeType
            case commitment
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "provider": self = .provider
                case "account": self = .account
                case "service": self = .service
                case "region": self = .region
                case "resource": self = .resource
                case "charge_type": self = .chargeType
                case "commitment": self = .commitment
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .provider: return "provider"
                case .account: return "account"
                case .service: return "service"
                case .region: return "region"
                case .resource: return "resource"
                case .chargeType: return "charge_type"
                case .commitment: return "commitment"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Dimension] = [
                .provider,
                .account,
                .service,
                .region,
                .resource,
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

        public var filters: [CostFilter]?
        /// Cost query language text.
        public var query: String?
        public var savedFilterId: String?
        public var chargeTypes: [CostChargeType]?
        public var costBasis: CostBasis?
        /// Row identity for the native layouts. Empty: one row per day and
        /// currency.
        public var dimensions: [Dimension]?
        /// Tag keys written as `tag_<key>` columns.
        public var tagKeys: [String]?
        /// Virtual tag keys written as `vtag_<key>` columns.
        public var virtualTagKeys: [String]?

        public init(
            filters: [CostFilter]? = nil,
            query: String? = nil,
            savedFilterId: String? = nil,
            chargeTypes: [CostChargeType]? = nil,
            costBasis: CostBasis? = nil,
            dimensions: [Dimension]? = nil,
            tagKeys: [String]? = nil,
            virtualTagKeys: [String]? = nil
        ) {
            self.filters = filters
            self.query = query
            self.savedFilterId = savedFilterId
            self.chargeTypes = chargeTypes
            self.costBasis = costBasis
            self.dimensions = dimensions
            self.tagKeys = tagKeys
            self.virtualTagKeys = virtualTagKeys
        }
    }

    public enum Format: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case csv
        case ndjson
        case focus
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "csv": self = .csv
            case "ndjson": self = .ndjson
            case "focus": self = .focus
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .csv: return "csv"
            case .ndjson: return "ndjson"
            case .focus: return "focus"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Format] = [
            .csv,
            .ndjson,
            .focus,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum FocusVersion: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case 14
        case 13
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "1.4": self = .14
            case "1.3": self = .13
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .14: return "1.4"
            case .13: return "1.3"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [FocusVersion] = [
            .14,
            .13,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Export a saved cost report's scope: its filters (with its saved filter
    /// expanded), its group-by as the row identity, its cost basis, and its unit
    /// cost when it draws one.
    public var reportId: String?
    /// An ad-hoc scope instead of a saved report.
    public var query: Query?
    /// `csv` / `ndjson`: Infrawrench's own columns (`day`, the group-by dimension
    /// or tag columns, `currency`, `amount`, `usage_amount`, `usage_unit`,
    /// `exported_at`, `collection_watermark`), plus per-day unit-cost columns
    /// (`unit_cost_metric`, `unit_cost_mode`, `unit_cost_scope_cost`,
    /// `unit_cost_metric_value`, `unit_cost_value`, `unit_cost_gap`) when the
    /// exported report draws a unit cost. `focus`: the FOCUS layout at full row
    /// grain, as CSV.
    public var format: Format
    /// FOCUS version for `format: focus`. Omitted means the latest (`1.4`).
    public var focusVersion: FocusVersion?
    /// First day, `YYYY-MM-DD`. Required with `query`; a report defaults to its
    /// own range.
    public var from: String?
    /// Last day, inclusive.
    public var to: String?

    public init(
        reportId: String? = nil,
        query: Query? = nil,
        format: Format,
        focusVersion: FocusVersion? = nil,
        from: String? = nil,
        to: String? = nil
    ) {
        self.reportId = reportId
        self.query = query
        self.format = format
        self.focusVersion = focusVersion
        self.from = from
        self.to = to
    }
}
