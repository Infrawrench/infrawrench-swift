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

public struct QueryMonitorTestResult: Codable, Hashable, Sendable {
    public enum State: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case ok
        case breaching
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "ok": self = .ok
            case "breaching": self = .breaching
            case "unknown": self = .unknown
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .ok: return "ok"
            case .breaching: return "breaching"
            case .unknown: return "unknown"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [State] = [
            .ok,
            .breaching,
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

    public var value: Double?
    /// `unknown` is a first-class state, not an absence: a monitor whose query
    /// failed has not told you the data is fine, and rendering that as `ok` is
    /// how a broken monitor becomes indistinguishable from a healthy one.
    public var state: State
    public var error: String?
    public var durationMs: Int
    /// Up to 20 rows, for the preview.
    public var rows: [[String: JSONValue]]

    public init(
        value: Double? = nil,
        state: State,
        error: String? = nil,
        durationMs: Int,
        rows: [[String: JSONValue]]
    ) {
        self.value = value
        self.state = state
        self.error = error
        self.durationMs = durationMs
        self.rows = rows
    }
}
