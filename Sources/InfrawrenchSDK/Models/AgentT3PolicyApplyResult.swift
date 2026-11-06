/*
 * InfrawrenchSDK v1.92.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.92.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AgentT3PolicyApplyResult: Codable, Hashable, Sendable {
    public struct Server: Codable, Hashable, Sendable {
        public enum Outcome: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case applied
            case installed
            case unchanged
            case skipped
            case settingUp
            case failed
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "applied": self = .applied
                case "installed": self = .installed
                case "unchanged": self = .unchanged
                case "skipped": self = .skipped
                case "setting-up": self = .settingUp
                case "failed": self = .failed
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .applied: return "applied"
                case .installed: return "installed"
                case .unchanged: return "unchanged"
                case .skipped: return "skipped"
                case .settingUp: return "setting-up"
                case .failed: return "failed"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Outcome] = [
                .applied,
                .installed,
                .unchanged,
                .skipped,
                .settingUp,
                .failed,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var sessionId: String
        public var projectName: String
        /// `applied`: installed and T3 Code restarted onto it. `installed`:
        /// applies at the next restart. `unchanged`: already had it. `skipped`:
        /// the policy does not fit this server, which keeps its policy.
        /// `setting-up`: setup has not finished; the server starts on this
        /// policy. `failed`: see `message`.
        public var outcome: Outcome
        public var message: String?

        public init(
            sessionId: String,
            projectName: String,
            outcome: Outcome,
            message: String? = nil
        ) {
            self.sessionId = sessionId
            self.projectName = projectName
            self.outcome = outcome
            self.message = message
        }
    }

    public var servers: [Server]

    public init(
        servers: [Server]
    ) {
        self.servers = servers
    }
}
