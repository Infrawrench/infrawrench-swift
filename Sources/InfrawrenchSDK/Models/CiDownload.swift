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

public struct CiDownload: Codable, Hashable, Sendable {
    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum Size: Codable, Hashable, Sendable {
        public enum SizeSize: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
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
            public static let allKnownCases: [SizeSize] = [
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
        case size(SizeSize)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(Double.self) {
                self = .double(value)
                return
            }
            if let value = try? container.decode(SizeSize.self) {
                self = .size(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .double(let value): try container.encode(value)
            case .size(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    /// Where the job left it: relative to the clone when it is under it, else
    /// absolute.
    public var path: String
    public var size: Size
    /// Of the stored bytes; for a text file, after masking.
    public var sha256: String
    public var contentType: String
    /// When it stops being served and is deleted.
    public var expiresAt: String
    /// A text file, with the run's secrets masked. `false` for a binary file,
    /// which is stored as the job left it.
    public var masked: Bool

    public init(
        path: String,
        size: Size,
        sha256: String,
        contentType: String,
        expiresAt: String,
        masked: Bool
    ) {
        self.path = path
        self.size = size
        self.sha256 = sha256
        self.contentType = contentType
        self.expiresAt = expiresAt
        self.masked = masked
    }
}
