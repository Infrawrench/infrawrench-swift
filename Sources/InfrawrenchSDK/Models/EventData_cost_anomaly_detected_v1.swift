/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `data` of a `cost.anomaly.detected` event, version 1. A provider or service
/// spent well outside its baseline, or a new source of spend appeared.
public struct EventData_cost_anomaly_detected_v1: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case spike
        case newSource
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "spike": self = .spike
            case "new_source": self = .newSource
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .spike: return "spike"
            case .newSource: return "new_source"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .spike,
            .newSource,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Dimension: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case provider
        case service
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "provider": self = .provider
            case "service": self = .service
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .provider: return "provider"
            case .service: return "service"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Dimension] = [
            .provider,
            .service,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Cost anomaly id.
    public var anomalyId: String
    /// The day (YYYY-MM-DD, UTC) the spend landed on.
    public var day: String
    /// Spike against a baseline, or a source with no prior spend.
    public var kind: Kind
    /// What `dimensionKey` names.
    public var dimension: Dimension
    /// The provider id or service name.
    public var dimensionKey: String
    /// Spend on `day`, in `currency`.
    public var actual: Double
    /// Mean daily spend over the baseline window, in `currency`.
    public var baseline: Double
    /// ISO 4217 currency code.
    public var currency: String
    /// What the change timeline and audit log say happened around then.
    public var hints: [String]

    public init(
        anomalyId: String,
        day: String,
        kind: Kind,
        dimension: Dimension,
        dimensionKey: String,
        actual: Double,
        baseline: Double,
        currency: String,
        hints: [String]
    ) {
        self.anomalyId = anomalyId
        self.day = day
        self.kind = kind
        self.dimension = dimension
        self.dimensionKey = dimensionKey
        self.actual = actual
        self.baseline = baseline
        self.currency = currency
        self.hints = hints
    }
}
