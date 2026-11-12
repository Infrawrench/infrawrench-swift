/*
 * InfrawrenchSDK v1.104.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.104.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiAccountCaches: Codable, Hashable, Sendable {
    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum UsedBytes: Codable, Hashable, Sendable {
        public enum UsedBytesUsedBytes: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case infinity
            case infinity2
            case naN
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "Infinity": self = .infinity
                case "-Infinity": self = .infinity2
                case "NaN": self = .naN
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .infinity: return "Infinity"
                case .infinity2: return "-Infinity"
                case .naN: return "NaN"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [UsedBytesUsedBytes] = [
                .infinity,
                .infinity2,
                .naN,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        case double(Double)
        case usedBytes(UsedBytesUsedBytes)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(Double.self) {
                self = .double(value)
                return
            }
            if let value = try? container.decode(UsedBytesUsedBytes.self) {
                self = .usedBytes(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .double(let value): try container.encode(value)
            case .usedBytes(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum QuotaBytes: Codable, Hashable, Sendable {
        public enum QuotaBytesQuotaBytes: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case infinity
            case infinity2
            case naN
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "Infinity": self = .infinity
                case "-Infinity": self = .infinity2
                case "NaN": self = .naN
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .infinity: return "Infinity"
                case .infinity2: return "-Infinity"
                case .naN: return "NaN"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [QuotaBytesQuotaBytes] = [
                .infinity,
                .infinity2,
                .naN,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        case double(Double)
        case quotaBytes(QuotaBytesQuotaBytes)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(Double.self) {
                self = .double(value)
                return
            }
            if let value = try? container.decode(QuotaBytesQuotaBytes.self) {
                self = .quotaBytes(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .double(let value): try container.encode(value)
            case .quotaBytes(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    public var installationId: Int
    public var accountLogin: String
    public var usedBytes: UsedBytes
    public var quotaBytes: QuotaBytes?
    public var repos: [CiRepoCache]
    /// Why the runners could not say what this account stores, when they could
    /// not.
    public var error: String?

    public init(
        installationId: Int,
        accountLogin: String,
        usedBytes: UsedBytes,
        quotaBytes: QuotaBytes? = nil,
        repos: [CiRepoCache],
        error: String? = nil
    ) {
        self.installationId = installationId
        self.accountLogin = accountLogin
        self.usedBytes = usedBytes
        self.quotaBytes = quotaBytes
        self.repos = repos
        self.error = error
    }
}
