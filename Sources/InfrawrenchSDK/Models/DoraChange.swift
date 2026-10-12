/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DoraChange: Codable, Hashable, Sendable {
    public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case deploy
        case resourceChange
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "deploy": self = .deploy
            case "resource_change": self = .resourceChange
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .deploy: return "deploy"
            case .resourceChange: return "resource_change"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Type2] = [
            .deploy,
            .resourceChange,
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
        case success
        case failure
        case inProgress
        case canceled
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "success": self = .success
            case "failure": self = .failure
            case "in_progress": self = .inProgress
            case "canceled": self = .canceled
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .success: return "success"
            case .failure: return "failure"
            case .inProgress: return "in_progress"
            case .canceled: return "canceled"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .success,
            .failure,
            .inProgress,
            .canceled,
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
    public var type: Type2
    public var name: String
    public var environment: String?
    public var repository: String?
    public var commitSha: String?
    public var at: String
    public var status: Status
    public var source: DoraSource
    public var pluginId: String?
    public var url: String?
    public var isRollback: Bool
    public var leadTimeHours: Double?
    public var failure: DoraFailure?
    /// Dimension id to value; null where the dimension is not known for this
    /// change.
    public var scope: [String: DoraScopeValue?]

    public init(
        id: String,
        type: Type2,
        name: String,
        environment: String? = nil,
        repository: String? = nil,
        commitSha: String? = nil,
        at: String,
        status: Status,
        source: DoraSource,
        pluginId: String? = nil,
        url: String? = nil,
        isRollback: Bool,
        leadTimeHours: Double? = nil,
        failure: DoraFailure? = nil,
        scope: [String: DoraScopeValue?]
    ) {
        self.id = id
        self.type = type
        self.name = name
        self.environment = environment
        self.repository = repository
        self.commitSha = commitSha
        self.at = at
        self.status = status
        self.source = source
        self.pluginId = pluginId
        self.url = url
        self.isRollback = isRollback
        self.leadTimeHours = leadTimeHours
        self.failure = failure
        self.scope = scope
    }
}
