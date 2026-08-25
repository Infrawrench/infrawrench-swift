/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
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

    public struct Acknowledgement: Codable, Hashable, Sendable {
        /// What somebody established this finding was. Also the annotation's
        /// text.
        public var explanation: String
        /// When the current explanation was recorded — restamped by a correction.
        public var acknowledgedAt: String
        public var acknowledgedByUserId: String?
        /// The cost annotation this created, drawn on every chart covering the
        /// anomalous day. Null once that note has been deleted — which removes
        /// the marker, never the acknowledgement: the finding stays explained.
        public var annotationId: String?

        public init(
            explanation: String,
            acknowledgedAt: String,
            acknowledgedByUserId: String? = nil,
            annotationId: String? = nil
        ) {
            self.explanation = explanation
            self.acknowledgedAt = acknowledgedAt
            self.acknowledgedByUserId = acknowledgedByUserId
            self.annotationId = annotationId
        }
    }

    public var id: String
    /// The anomalous UTC day.
    public var day: String
    /// Which detection produced the row. `spike` is spend far above the key's own
    /// trailing baseline; `new_source` is a provider or service with no spend at
    /// all across the trailing window that suddenly has material spend — it can
    /// never be a `spike`, since a zero baseline has no mean or deviation to
    /// exceed. Rows written before new-source detection existed read as `spike`.
    public var kind: Kind
    public var dimension: Dimension
    /// The dimension's value — a plugin id or a service name.
    public var dimensionKey: String
    public var currency: String
    public var actualCents: Int
    /// Mean daily spend over the trailing 28-day baseline, in cents. Zero, or
    /// near it, for a `new_source` — clients must not compute a percentage change
    /// from it.
    public var baselineCents: Int
    /// The detection bar the day cleared, in cents: baseline mean + N·stddev for
    /// a `spike`, the new-source floor for a `new_source`.
    public var thresholdCents: Int
    public var detectedAt: String
    /// When the anomaly was delivered to a notification channel; null when
    /// delivery failed or a recent anomaly for the same key suppressed it.
    public var notifiedAt: String?
    /// Root-cause hints computed when the anomaly fired: human-readable facts
    /// from the change timeline and audit log for the anomalous day and the day
    /// before (e.g. "12 gce-instance resources appeared", a workflow run, a
    /// lifted change freeze), ranked by likely relevance and capped at three.
    /// Empty when nothing notable happened in the window or the anomaly predates
    /// hint collection.
    public var hints: [String]
    /// Present once somebody has explained this finding, null while it is still
    /// an open question. Acknowledging does not suppress detection — the same key
    /// spiking again on a later day is a new anomaly and fires as normal.
    public var acknowledgement: Acknowledgement?

    public init(
        id: String,
        day: String,
        kind: Kind,
        dimension: Dimension,
        dimensionKey: String,
        currency: String,
        actualCents: Int,
        baselineCents: Int,
        thresholdCents: Int,
        detectedAt: String,
        notifiedAt: String? = nil,
        hints: [String],
        acknowledgement: Acknowledgement? = nil
    ) {
        self.id = id
        self.day = day
        self.kind = kind
        self.dimension = dimension
        self.dimensionKey = dimensionKey
        self.currency = currency
        self.actualCents = actualCents
        self.baselineCents = baselineCents
        self.thresholdCents = thresholdCents
        self.detectedAt = detectedAt
        self.notifiedAt = notifiedAt
        self.hints = hints
        self.acknowledgement = acknowledgement
    }
}
