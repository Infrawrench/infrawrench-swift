/*
 * InfrawrenchSDK v0.24.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.24.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAnomaly: Codable, Hashable, Sendable {
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

    public var id: String
    /// The anomalous UTC day.
    public var day: String
    public var dimension: Dimension
    /// The dimension's value — a plugin id or a service name.
    public var dimensionKey: String
    public var currency: String
    public var actualCents: Int
    /// Mean daily spend over the trailing 28-day baseline, in cents.
    public var baselineCents: Int
    /// The detection bar the day cleared (baseline mean + N·stddev), in cents.
    public var thresholdCents: Int
    public var detectedAt: String
    /// When the anomaly was delivered to a notification channel; null when
    /// delivery failed or a recent anomaly for the same key suppressed it.
    public var notifiedAt: String?

    public init(
        id: String,
        day: String,
        dimension: Dimension,
        dimensionKey: String,
        currency: String,
        actualCents: Int,
        baselineCents: Int,
        thresholdCents: Int,
        detectedAt: String,
        notifiedAt: String? = nil
    ) {
        self.id = id
        self.day = day
        self.dimension = dimension
        self.dimensionKey = dimensionKey
        self.currency = currency
        self.actualCents = actualCents
        self.baselineCents = baselineCents
        self.thresholdCents = thresholdCents
        self.detectedAt = detectedAt
        self.notifiedAt = notifiedAt
    }
}
