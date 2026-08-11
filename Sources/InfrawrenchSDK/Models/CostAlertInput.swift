/*
 * InfrawrenchSDK v1.9.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.9.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAlertInput: Codable, Hashable, Sendable {
    public enum GroupBy: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
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

    public var name: String
    public var filters: [CostAlertFilter]?
    /// Per-group fan-out. Null watches the scope's one total; a dimension watches
    /// each group against its own prior window, and each offending group fires
    /// its own event.
    public var groupBy: GroupBy?
    /// Required when groupBy is tag.
    public var groupByTagKey: String?
    public var cadence: CostChangeCadence
    /// Percent of the prior window's spend the change must reach. At least one of
    /// the two thresholds must be set; when both are, BOTH must hold before the
    /// alert fires.
    public var thresholdPercent: Int?
    /// Cents the change must reach.
    public var thresholdAmountCents: Int?
    public var direction: CostChangeDirection
    public var enabled: Bool?

    public init(
        name: String,
        filters: [CostAlertFilter]? = nil,
        groupBy: GroupBy? = nil,
        groupByTagKey: String? = nil,
        cadence: CostChangeCadence,
        thresholdPercent: Int? = nil,
        thresholdAmountCents: Int? = nil,
        direction: CostChangeDirection,
        enabled: Bool? = nil
    ) {
        self.name = name
        self.filters = filters
        self.groupBy = groupBy
        self.groupByTagKey = groupByTagKey
        self.cadence = cadence
        self.thresholdPercent = thresholdPercent
        self.thresholdAmountCents = thresholdAmountCents
        self.direction = direction
        self.enabled = enabled
    }
}
