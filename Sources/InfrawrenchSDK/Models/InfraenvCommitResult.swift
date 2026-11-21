/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct InfraenvCommitResult: Codable, Hashable, Sendable {
    public enum Mode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case commit
        case pullRequest
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "commit": self = .commit
            case "pull-request": self = .pullRequest
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .commit: return "commit"
            case .pullRequest: return "pull-request"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Mode] = [
            .commit,
            .pullRequest,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct PullRequest: Codable, Hashable, Sendable {
        public var number: Int
        public var url: String

        public init(
            number: Int,
            url: String
        ) {
            self.number = number
            self.url = url
        }
    }

    public var mode: Mode
    public var branch: String
    public var commitSha: String
    public var commitUrl: String
    public var pullRequest: PullRequest?

    public init(
        mode: Mode,
        branch: String,
        commitSha: String,
        commitUrl: String,
        pullRequest: PullRequest? = nil
    ) {
        self.mode = mode
        self.branch = branch
        self.commitSha = commitSha
        self.commitUrl = commitUrl
        self.pullRequest = pullRequest
    }
}
