/*
 * InfrawrenchSDK v1.24.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.24.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PublicStatusPage: Codable, Hashable, Sendable {
    public enum State: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case operational
        case degraded
        case majorOutage
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "operational": self = .operational
            case "degraded": self = .degraded
            case "major_outage": self = .majorOutage
            case "unknown": self = .unknown
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .operational: return "operational"
            case .degraded: return "degraded"
            case .majorOutage: return "major_outage"
            case .unknown: return "unknown"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [State] = [
            .operational,
            .degraded,
            .majorOutage,
            .unknown,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var title: String
    public var description: String?
    /// Rollup over the components. `degraded` means some but not all are down;
    /// components with no data are ignored rather than dragging the page to
    /// unknown.
    public var state: State
    /// One sentence describing `state`.
    public var summary: String
    public var components: [PublicStatusComponent]
    public var supportUrl: String?
    public var showHistory: Bool
    public var showUptime: Bool
    public var historyDays: Int
    public var generatedAt: String

    public init(
        title: String,
        description: String? = nil,
        state: State,
        summary: String,
        components: [PublicStatusComponent],
        supportUrl: String? = nil,
        showHistory: Bool,
        showUptime: Bool,
        historyDays: Int,
        generatedAt: String
    ) {
        self.title = title
        self.description = description
        self.state = state
        self.summary = summary
        self.components = components
        self.supportUrl = supportUrl
        self.showHistory = showHistory
        self.showUptime = showUptime
        self.historyDays = historyDays
        self.generatedAt = generatedAt
    }
}
