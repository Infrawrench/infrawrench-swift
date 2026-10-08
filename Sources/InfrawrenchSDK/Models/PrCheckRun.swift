/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PrCheckRun: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case running
        case completed
        case failed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "running": self = .running
            case "completed": self = .completed
            case "failed": self = .failed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .running: return "running"
            case .completed: return "completed"
            case .failed: return "failed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .running,
            .completed,
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
    public var repositoryId: String
    public var repo: String
    public var pullNumber: Int
    public var pullTitle: String?
    public var pullUrl: String?
    public var headSha: String
    public var status: Status
    public var conclusion: PrCheckConclusion?
    public var checkRunUrl: String?
    public var commentUrl: String?
    public var report: PrCheckReport?
    public var error: String?
    public var createdAt: String
    public var completedAt: String?

    public init(
        id: String,
        repositoryId: String,
        repo: String,
        pullNumber: Int,
        pullTitle: String? = nil,
        pullUrl: String? = nil,
        headSha: String,
        status: Status,
        conclusion: PrCheckConclusion? = nil,
        checkRunUrl: String? = nil,
        commentUrl: String? = nil,
        report: PrCheckReport? = nil,
        error: String? = nil,
        createdAt: String,
        completedAt: String? = nil
    ) {
        self.id = id
        self.repositoryId = repositoryId
        self.repo = repo
        self.pullNumber = pullNumber
        self.pullTitle = pullTitle
        self.pullUrl = pullUrl
        self.headSha = headSha
        self.status = status
        self.conclusion = conclusion
        self.checkRunUrl = checkRunUrl
        self.commentUrl = commentUrl
        self.report = report
        self.error = error
        self.createdAt = createdAt
        self.completedAt = completedAt
    }
}
