/*
 * InfrawrenchSDK v0.44.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.44.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MetricAlertEvent: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case firing
        case resolved
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "firing": self = .firing
            case "resolved": self = .resolved
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .firing: return "firing"
            case .resolved: return "resolved"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .firing,
            .resolved,
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
    public var ruleId: String
    public var ruleName: String
    public var resourceId: String
    public var resourceName: String
    public var status: Status
    /// Worst sample observed in the breaching window, in the metric's unit.
    public var observedValue: Double
    public var firedAt: String
    public var resolvedAt: String?

    public init(
        id: String,
        ruleId: String,
        ruleName: String,
        resourceId: String,
        resourceName: String,
        status: Status,
        observedValue: Double,
        firedAt: String,
        resolvedAt: String? = nil
    ) {
        self.id = id
        self.ruleId = ruleId
        self.ruleName = ruleName
        self.resourceId = resourceId
        self.resourceName = resourceName
        self.status = status
        self.observedValue = observedValue
        self.firedAt = firedAt
        self.resolvedAt = resolvedAt
    }
}
