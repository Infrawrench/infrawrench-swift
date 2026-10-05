/*
 * InfrawrenchSDK v1.73.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.73.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CustomCostUploadCreate: Codable, Hashable, Sendable {
    public enum Format: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case csv
        case focus
        case rows
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "csv": self = .csv
            case "focus": self = .focus
            case "rows": self = .rows
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .csv: return "csv"
            case .focus: return "focus"
            case .rows: return "rows"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Format] = [
            .csv,
            .focus,
            .rows,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Mode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case append
        case replace
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "append": self = .append
            case "replace": self = .replace
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .append: return "append"
            case .replace: return "replace"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Mode] = [
            .append,
            .replace,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Via: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case web
        case desktop
        case cli
        case api
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "web": self = .web
            case "desktop": self = .desktop
            case "cli": self = .cli
            case "api": self = .api
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .web: return "web"
            case .desktop: return "desktop"
            case .cli: return "cli"
            case .api: return "api"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Via] = [
            .web,
            .desktop,
            .cli,
            .api,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var fileName: String?
    public var format: Format
    /// What to do with spend this source already holds in the range. `append`
    /// adds to it; `replace` zeroes it (from every earlier upload) when this
    /// upload completes. Required when the range overlaps an earlier upload that
    /// still holds rows: omitted, that case is a 409 listing the overlapping
    /// uploads.
    public var mode: Mode?
    public var via: Via?
    /// Inclusive. Rows outside the range are rejected.
    public var fromDate: String
    public var toDate: String

    public init(
        fileName: String? = nil,
        format: Format,
        mode: Mode? = nil,
        via: Via? = nil,
        fromDate: String,
        toDate: String
    ) {
        self.fileName = fileName
        self.format = format
        self.mode = mode
        self.via = via
        self.fromDate = fromDate
        self.toDate = toDate
    }
}
