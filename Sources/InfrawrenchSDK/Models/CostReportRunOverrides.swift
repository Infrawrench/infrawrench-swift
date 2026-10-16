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

public struct CostReportRunOverrides: Codable, Hashable, Sendable {
    public enum XAxis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case date
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
            case "date": self = .date
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
            case .date: return "date"
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
        public static let allKnownCases: [XAxis] = [
            .date,
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

    public var measure: CostMeasure?
    /// The usage unit a `usage` measure sums, exactly as the provider spells it
    /// (`Hrs`, `GB-Mo`). List them with GET
    /// /costs/dimensions?dimension=usage-units. Required for `usage`, refused for
    /// any other measure.
    public var usageUnit: String?
    public var binning: CostBinning?
    /// Running totals from the start of the range, at any bin size. Omitted is
    /// off. Totals then report the last point rather than the sum.
    public var cumulative: Bool?
    /// Put a dimension on the X axis for this run, or `date` to put the date bins
    /// back on a report saved with a dimension axis. A dimension axis drops the
    /// saved forecast and scenario for the run; a count or running total falls
    /// back to the date axis.
    public var xAxis: XAxis?
    /// Required when `xAxis` is `tag` or `virtual_tag`: which key's values go on
    /// the axis.
    public var xAxisTagKey: String?

    public init(
        measure: CostMeasure? = nil,
        usageUnit: String? = nil,
        binning: CostBinning? = nil,
        cumulative: Bool? = nil,
        xAxis: XAxis? = nil,
        xAxisTagKey: String? = nil
    ) {
        self.measure = measure
        self.usageUnit = usageUnit
        self.binning = binning
        self.cumulative = cumulative
        self.xAxis = xAxis
        self.xAxisTagKey = xAxisTagKey
    }
}
