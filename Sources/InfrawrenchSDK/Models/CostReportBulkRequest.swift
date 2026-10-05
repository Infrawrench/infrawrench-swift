/*
 * InfrawrenchSDK v1.67.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.67.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// At least one id and at most 500 in total. Reports and folders are validated
/// together against the tree as it will be after every move, then applied in one
/// transaction.
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum CostReportBulkRequest: Codable, Hashable, Sendable {
    public struct CostReportBulkRequestObject: Codable, Hashable, Sendable {
        public enum Action: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case move
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "move": self = .move
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .move: return "move"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Action] = [
                .move,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var action: Action
        public var reportIds: [String]
        public var folderIds: [String]
        /// Destination folder; null is the top level. Reports are filed into it
        /// and folders become its direct children. Needs editor on the
        /// destination, because a folder's sharing extends to what is filed in
        /// it.
        public var targetFolderId: String?

        public init(
            action: Action,
            reportIds: [String],
            folderIds: [String],
            targetFolderId: String? = nil
        ) {
            self.action = action
            self.reportIds = reportIds
            self.folderIds = folderIds
            self.targetFolderId = targetFolderId
        }
    }

    public struct CostReportBulkRequestObject2: Codable, Hashable, Sendable {
        public enum Action: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case delete
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "delete": self = .delete
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .delete: return "delete"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Action] = [
                .delete,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var action: Action
        public var reportIds: [String]
        public var folderIds: [String]

        public init(
            action: Action,
            reportIds: [String],
            folderIds: [String]
        ) {
            self.action = action
            self.reportIds = reportIds
            self.folderIds = folderIds
        }
    }

    case object(CostReportBulkRequestObject)
    case object2(CostReportBulkRequestObject2)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CostReportBulkRequestObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(CostReportBulkRequestObject2.self) {
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
