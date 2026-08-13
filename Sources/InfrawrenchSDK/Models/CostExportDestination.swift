/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum CostExportDestination: Codable, Hashable, Sendable {
    public struct CostExportDestinationObject: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case s3
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "s3": self = .s3
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .s3: return "s3"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .s3,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        public var bucket: String
        /// Key prefix, no leading or trailing slash.
        public var `prefix`: String
        /// AWS-style region. Cloudflare R2 wants `auto`.
        public var region: String
        /// S3 API origin. Empty means AWS S3 proper. Set it for R2, Spaces,
        /// Scaleway, B2 or MinIO.
        public var endpoint: String
        /// Address the bucket as a path segment. MinIO needs this; AWS and R2 do
        /// not.
        public var forcePathStyle: Bool

        public init(
            kind: Kind,
            bucket: String,
            `prefix`: String,
            region: String,
            endpoint: String,
            forcePathStyle: Bool
        ) {
            self.kind = kind
            self.bucket = bucket
            self.`prefix` = `prefix`
            self.region = region
            self.endpoint = endpoint
            self.forcePathStyle = forcePathStyle
        }
    }

    public struct CostExportDestinationObject2: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case http
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "http": self = .http
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .http: return "http"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .http,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Method: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case post
            case put
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "POST": self = .post
                case "PUT": self = .put
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .post: return "POST"
                case .put: return "PUT"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Method] = [
                .post,
                .put,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        public var method: Method
        /// Redacted marker for the stored URL. The URL itself is a bearer
        /// credential and is never returned.
        public var urlHint: String

        public init(
            kind: Kind,
            method: Method,
            urlHint: String
        ) {
            self.kind = kind
            self.method = method
            self.urlHint = urlHint
        }
    }

    case object(CostExportDestinationObject)
    case object2(CostExportDestinationObject2)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CostExportDestinationObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(CostExportDestinationObject2.self) {
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
