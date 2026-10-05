/*
 * InfrawrenchSDK v1.62.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.62.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct VirtualTag: Codable, Hashable, Sendable {
    public struct Status: Codable, Hashable, Sendable {
        public enum State: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case pending
            case processing
            case ready
            case failed
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "pending": self = .pending
                case "processing": self = .processing
                case "ready": self = .ready
                case "failed": self = .failed
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .pending: return "pending"
                case .processing: return "processing"
                case .ready: return "ready"
                case .failed: return "failed"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [State] = [
                .pending,
                .processing,
                .ready,
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

        public var state: State
        public var processedAt: String?
        public var error: String?
        public var stats: VirtualTagStats?

        public init(
            state: State,
            processedAt: String? = nil,
            error: String? = nil,
            stats: VirtualTagStats? = nil
        ) {
            self.state = state
            self.processedAt = processedAt
            self.error = error
            self.stats = stats
        }
    }

    public var id: String
    public var key: String
    public var name: String
    public var description: String?
    public var defaultValue: String?
    public var rules: [VirtualTagRule]
    /// The background evaluation over stored history. Queries never wait on it: a
    /// saved rule applies to every read immediately; this is the account of what
    /// the rules do.
    public var status: Status
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        key: String,
        name: String,
        description: String? = nil,
        defaultValue: String? = nil,
        rules: [VirtualTagRule],
        status: Status,
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.key = key
        self.name = name
        self.description = description
        self.defaultValue = defaultValue
        self.rules = rules
        self.status = status
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
