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

public struct ObjectSharing: Codable, Hashable, Sendable {
    public enum CallerLevel: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case owner
        case editor
        case viewer
        case none
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "owner": self = .owner
            case "editor": self = .editor
            case "viewer": self = .viewer
            case "none": self = .none
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .owner: return "owner"
            case .editor: return "editor"
            case .viewer: return "viewer"
            case .none: return "none"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [CallerLevel] = [
            .owner,
            .editor,
            .viewer,
            .none,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct InheritedFrom: Codable, Hashable, Sendable {
        public enum Level: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case owner
            case editor
            case viewer
            case none
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "owner": self = .owner
                case "editor": self = .editor
                case "viewer": self = .viewer
                case "none": self = .none
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .owner: return "owner"
                case .editor: return "editor"
                case .viewer: return "viewer"
                case .none: return "none"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Level] = [
                .owner,
                .editor,
                .viewer,
                .none,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var folderId: String
        public var folderName: String
        public var level: Level

        public init(
            folderId: String,
            folderName: String,
            level: Level
        ) {
            self.folderId = folderId
            self.folderName = folderName
            self.level = level
        }
    }

    public var objectType: ShareableObjectType
    public var objectId: String
    public var orgAccess: OrgAccessLevel
    public var grants: [ObjectAccessGrant]
    /// What the caller can do with this object.
    public var callerLevel: CallerLevel
    /// Access the containing folder's explicit sharing already gives the caller.
    public var inheritedFrom: InheritedFrom?

    public init(
        objectType: ShareableObjectType,
        objectId: String,
        orgAccess: OrgAccessLevel,
        grants: [ObjectAccessGrant],
        callerLevel: CallerLevel,
        inheritedFrom: InheritedFrom? = nil
    ) {
        self.objectType = objectType
        self.objectId = objectId
        self.orgAccess = orgAccess
        self.grants = grants
        self.callerLevel = callerLevel
        self.inheritedFrom = inheritedFrom
    }
}
