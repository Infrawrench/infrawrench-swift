/*
 * InfrawrenchSDK v1.39.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.39.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IncidentTimeline: Codable, Hashable, Sendable {
    public struct Feed: Codable, Hashable, Sendable {
        public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case ok
            case omitted
            case error
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "ok": self = .ok
                case "omitted": self = .omitted
                case "error": self = .error
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .ok: return "ok"
                case .omitted: return "omitted"
                case .error: return "error"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Status] = [
                .ok,
                .omitted,
                .error,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var feed: String
        public var status: Status
        public var error: String?

        public init(
            feed: String,
            status: Status,
            error: String? = nil
        ) {
            self.feed = feed
            self.status = status
            self.error = error
        }
    }

    public var incidentId: String
    public var from: String
    /// `resolvedAt`, or the server's clock while the incident is open.
    public var to: String
    public var generatedAt: String
    public var entries: [IncidentTimelineEntry]
    /// Per-feed health, passed through from the moment union: `omitted` means the
    /// caller lacks that feed's read permission, `error` means it failed and the
    /// rest is still good.
    public var feeds: [Feed]
    public var truncated: Bool

    public init(
        incidentId: String,
        from: String,
        to: String,
        generatedAt: String,
        entries: [IncidentTimelineEntry],
        feeds: [Feed],
        truncated: Bool
    ) {
        self.incidentId = incidentId
        self.from = from
        self.to = to
        self.generatedAt = generatedAt
        self.entries = entries
        self.feeds = feeds
        self.truncated = truncated
    }
}
