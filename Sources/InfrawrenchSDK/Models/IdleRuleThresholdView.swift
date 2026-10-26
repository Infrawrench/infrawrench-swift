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

public struct IdleRuleThresholdView: Codable, Hashable, Sendable {
    public enum Unit: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case count
        case bytes
        case percent
        case days
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "count": self = .count
            case "bytes": self = .bytes
            case "percent": self = .percent
            case "days": self = .days
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .count: return "count"
            case .bytes: return "bytes"
            case .percent: return "percent"
            case .days: return "days"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Unit] = [
            .count,
            .bytes,
            .percent,
            .days,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var key: String
    public var label: String
    public var description: String?
    public var unit: Unit
    public var `default`: Double
    public var min: Double
    public var max: Double
    /// The effective value after the organization's override.
    public var value: Double

    public init(
        key: String,
        label: String,
        description: String? = nil,
        unit: Unit,
        `default`: Double,
        min: Double,
        max: Double,
        value: Double
    ) {
        self.key = key
        self.label = label
        self.description = description
        self.unit = unit
        self.`default` = `default`
        self.min = min
        self.max = max
        self.value = value
    }
}
