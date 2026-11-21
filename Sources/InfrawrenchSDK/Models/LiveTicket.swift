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

/// How to learn that a topic changed. Clients should treat an unknown `driver` as
/// `poll`.
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum LiveTicket: Codable, Hashable, Sendable {
    public struct LiveTicketObject: Codable, Hashable, Sendable {
        public enum Driver: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case poll
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "poll": self = .poll
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .poll: return "poll"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Driver] = [
                .poll,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// No push channel is configured: refetch on your own interval.
        public var driver: Driver

        public init(
            driver: Driver
        ) {
            self.driver = driver
        }
    }

    public struct LiveTicketObject2: Codable, Hashable, Sendable {
        public enum Driver: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case neon
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "neon": self = .neon
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .neon: return "neon"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Driver] = [
                .neon,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// Subscribe to `query` at `url` with the Neon Realtime client and
        /// refetch whenever its result changes. The result carries ids and
        /// statuses only, never the data itself.
        public var driver: Driver
        /// The Neon Realtime WebSocket URL.
        public var url: String
        public var query: LiveSealedQuery

        public init(
            driver: Driver,
            url: String,
            query: LiveSealedQuery
        ) {
            self.driver = driver
            self.url = url
            self.query = query
        }
    }

    case object(LiveTicketObject)
    case object2(LiveTicketObject2)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(LiveTicketObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(LiveTicketObject2.self) {
            self = .object2(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
