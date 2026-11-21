/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct HeartbeatPing: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case success
        case start
        case fail
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "success": self = .success
            case "start": self = .start
            case "fail": self = .fail
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .success: return "success"
            case .start: return "start"
            case .fail: return "fail"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .success,
            .start,
            .fail,
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
    public var kind: Kind
    public var receivedAt: String
    public var durationMs: Int?
    public var method: String
    public var userAgent: String?
    /// The first 1000 characters of the request body, when the job sent one.
    public var body: String?

    public init(
        id: String,
        kind: Kind,
        receivedAt: String,
        durationMs: Int? = nil,
        method: String,
        userAgent: String? = nil,
        body: String? = nil
    ) {
        self.id = id
        self.kind = kind
        self.receivedAt = receivedAt
        self.durationMs = durationMs
        self.method = method
        self.userAgent = userAgent
        self.body = body
    }
}
