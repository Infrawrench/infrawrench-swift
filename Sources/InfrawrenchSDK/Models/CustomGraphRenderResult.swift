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

public struct CustomGraphRenderResult: Codable, Hashable, Sendable {
    public struct Log: Codable, Hashable, Sendable {
        public enum Level: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case info
            case warn
            case error
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "info": self = .info
                case "warn": self = .warn
                case "error": self = .error
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .info: return "info"
                case .warn: return "warn"
                case .error: return "error"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Level] = [
                .info,
                .warn,
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

        public var level: Level
        public var message: String

        public init(
            level: Level,
            message: String
        ) {
            self.level = level
            self.message = message
        }
    }

    public var ok: Bool
    public var spec: JsonObject?
    public var error: String?
    public var logs: [Log]
    public var renderedAt: String
    public var durationMs: Int

    public init(
        ok: Bool,
        spec: JsonObject? = nil,
        error: String? = nil,
        logs: [Log],
        renderedAt: String,
        durationMs: Int
    ) {
        self.ok = ok
        self.spec = spec
        self.error = error
        self.logs = logs
        self.renderedAt = renderedAt
        self.durationMs = durationMs
    }
}
