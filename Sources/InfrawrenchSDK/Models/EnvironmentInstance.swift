/*
 * InfrawrenchSDK v1.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.28.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentInstance: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case creating
        case active
        case partial
        case tearingDown
        case deleted
        case failed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "creating": self = .creating
            case "active": self = .active
            case "partial": self = .partial
            case "tearing-down": self = .tearingDown
            case "deleted": self = .deleted
            case "failed": self = .failed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .creating: return "creating"
            case .active: return "active"
            case .partial: return "partial"
            case .tearingDown: return "tearing-down"
            case .deleted: return "deleted"
            case .failed: return "failed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .creating,
            .active,
            .partial,
            .tearingDown,
            .deleted,
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

    public var id: String
    public var templateId: String?
    public var templateName: String
    public var name: String
    public var namePrefix: String
    public var parameters: [String: String]
    /// `partial` means a create failed part-way: the members that were created
    /// are recorded and can still be torn down, which is what stops a
    /// half-finished run leaving cloud resources with no row pointing at them.
    public var status: Status
    public var expiresAt: String
    public var error: String?
    public var members: [EnvironmentInstanceMember]
    public var createdAt: String
    public var updatedAt: String
    public var completedAt: String?

    public init(
        id: String,
        templateId: String? = nil,
        templateName: String,
        name: String,
        namePrefix: String,
        parameters: [String: String],
        status: Status,
        expiresAt: String,
        error: String? = nil,
        members: [EnvironmentInstanceMember],
        createdAt: String,
        updatedAt: String,
        completedAt: String? = nil
    ) {
        self.id = id
        self.templateId = templateId
        self.templateName = templateName
        self.name = name
        self.namePrefix = namePrefix
        self.parameters = parameters
        self.status = status
        self.expiresAt = expiresAt
        self.error = error
        self.members = members
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.completedAt = completedAt
    }
}
