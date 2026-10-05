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

public struct GithubIssueLink: Codable, Hashable, Sendable {
    public enum State: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case open
        case closed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "open": self = .open
            case "closed": self = .closed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .open: return "open"
            case .closed: return "closed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [State] = [
            .open,
            .closed,
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
    public var sourceKind: GithubIssueSourceKind
    public var sourceId: String
    /// Hash of the finding; also written into the issue body as a hidden marker.
    public var fingerprint: String
    public var repo: String
    public var installationId: Int
    public var issueNumber: Int
    public var issueUrl: String
    public var state: State
    public var autoFiled: Bool
    public var pullRequestNumber: Int?
    public var pullRequestUrl: String?
    public var createdByUserId: String?
    public var createdAt: String
    public var resolvedAt: String?

    public init(
        id: String,
        sourceKind: GithubIssueSourceKind,
        sourceId: String,
        fingerprint: String,
        repo: String,
        installationId: Int,
        issueNumber: Int,
        issueUrl: String,
        state: State,
        autoFiled: Bool,
        pullRequestNumber: Int? = nil,
        pullRequestUrl: String? = nil,
        createdByUserId: String? = nil,
        createdAt: String,
        resolvedAt: String? = nil
    ) {
        self.id = id
        self.sourceKind = sourceKind
        self.sourceId = sourceId
        self.fingerprint = fingerprint
        self.repo = repo
        self.installationId = installationId
        self.issueNumber = issueNumber
        self.issueUrl = issueUrl
        self.state = state
        self.autoFiled = autoFiled
        self.pullRequestNumber = pullRequestNumber
        self.pullRequestUrl = pullRequestUrl
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.resolvedAt = resolvedAt
    }
}
