/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CustomCostUpload: Codable, Hashable, Sendable {
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

    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case uploading
        case complete
        case replaced
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "uploading": self = .uploading
            case "complete": self = .complete
            case "replaced": self = .replaced
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .uploading: return "uploading"
            case .complete: return "complete"
            case .replaced: return "replaced"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .uploading,
            .complete,
            .replaced,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct UploadedBy: Codable, Hashable, Sendable {
        public var id: String
        public var name: String?
        public var email: String?

        public init(
            id: String,
            name: String? = nil,
            email: String? = nil
        ) {
            self.id = id
            self.name = name
            self.email = email
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

    public var id: String
    public var sourceId: String
    public var fileName: String?
    public var format: Format
    public var mode: Mode
    /// `uploading` until complete is called (an interrupted upload stays here and
    /// can be deleted); `replaced` once a later replace upload superseded every
    /// row it held.
    public var status: Status
    public var fromDate: String
    public var toDate: String
    /// Daily rows this upload still holds.
    public var rowCount: Int
    /// Currency code → cash amount this upload still holds.
    public var totals: [String: Double]
    public var uploadedBy: UploadedBy?
    public var via: Via
    public var createdAt: String
    public var completedAt: String?

    public init(
        id: String,
        sourceId: String,
        fileName: String? = nil,
        format: Format,
        mode: Mode,
        status: Status,
        fromDate: String,
        toDate: String,
        rowCount: Int,
        totals: [String: Double],
        uploadedBy: UploadedBy? = nil,
        via: Via,
        createdAt: String,
        completedAt: String? = nil
    ) {
        self.id = id
        self.sourceId = sourceId
        self.fileName = fileName
        self.format = format
        self.mode = mode
        self.status = status
        self.fromDate = fromDate
        self.toDate = toDate
        self.rowCount = rowCount
        self.totals = totals
        self.uploadedBy = uploadedBy
        self.via = via
        self.createdAt = createdAt
        self.completedAt = completedAt
    }
}
