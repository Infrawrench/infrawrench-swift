/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DoraDeploymentInput: Codable, Hashable, Sendable {
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

    /// Your id for the deploy (max 200). Sending it again updates the same
    /// deploy.
    public var externalId: String
    /// What was deployed, as a person calls it (max 300).
    public var name: String
    /// Environment name, matched against the production patterns.
    public var environment: String
    /// `owner/name` or a repository URL.
    public var repository: String?
    /// Hexadecimal, 7-64 characters.
    public var commitSha: String?
    /// When the commit was authored, if known.
    public var commitAt: String?
    public var deployedAt: String
    /// Defaults to `success`.
    public var status: Status?
    public var isRollback: Bool?
    public var url: String?

    public init(
        externalId: String,
        name: String,
        environment: String,
        repository: String? = nil,
        commitSha: String? = nil,
        commitAt: String? = nil,
        deployedAt: String,
        status: Status? = nil,
        isRollback: Bool? = nil,
        url: String? = nil
    ) {
        self.externalId = externalId
        self.name = name
        self.environment = environment
        self.repository = repository
        self.commitSha = commitSha
        self.commitAt = commitAt
        self.deployedAt = deployedAt
        self.status = status
        self.isRollback = isRollback
        self.url = url
    }
}
