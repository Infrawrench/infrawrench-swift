/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricValue: Codable, Hashable, Sendable {
    public enum Source: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case api
        case workflow
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "api": self = .api
            case "workflow": self = .workflow
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .api: return "api"
            case .workflow: return "workflow"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Source] = [
            .api,
            .workflow,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// UTC day, YYYY-MM-DD.
    public var day: String
    public var value: Double
    public var source: Source
    public var updatedAt: String

    public init(
        day: String,
        value: Double,
        source: Source,
        updatedAt: String
    ) {
        self.day = day
        self.value = value
        self.source = source
        self.updatedAt = updatedAt
    }
}
