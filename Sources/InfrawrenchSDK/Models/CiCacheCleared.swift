/*
 * InfrawrenchSDK v1.105.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.105.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiCacheCleared: Codable, Hashable, Sendable {
    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum DeletedBytes: Codable, Hashable, Sendable {
        public enum DeletedBytesDeletedBytes: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
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
            public static let allKnownCases: [DeletedBytesDeletedBytes] = [
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
        case deletedBytes(DeletedBytesDeletedBytes)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(Double.self) {
                self = .double(value)
                return
            }
            if let value = try? container.decode(DeletedBytesDeletedBytes.self) {
                self = .deletedBytes(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .double(let value): try container.encode(value)
            case .deletedBytes(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    public var installationId: Int
    public var repo: String
    public var deletedEntries: Int
    public var deletedBytes: DeletedBytes

    public init(
        installationId: Int,
        repo: String,
        deletedEntries: Int,
        deletedBytes: DeletedBytes
    ) {
        self.installationId = installationId
        self.repo = repo
        self.deletedEntries = deletedEntries
        self.deletedBytes = deletedBytes
    }
}
