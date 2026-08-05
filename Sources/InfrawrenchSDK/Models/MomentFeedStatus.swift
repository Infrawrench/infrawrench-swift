/*
 * InfrawrenchSDK v0.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MomentFeedStatus: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case ok
        case omitted
        case error
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
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

    public var feed: MomentFeedId
    /// `omitted` = the caller lacks the feed's read permission; `error` = the
    /// feed's query failed but the rest of the response is still valid
    /// (partial-failure tolerance).
    public var status: Status
    /// Short failure reason when `status` is `error`.
    public var error: String?
    /// True when the feed hit its row cap and events were dropped.
    public var truncated: Bool?

    public init(
        feed: MomentFeedId,
        status: Status,
        error: String? = nil,
        truncated: Bool? = nil
    ) {
        self.feed = feed
        self.status = status
        self.error = error
        self.truncated = truncated
    }
}
