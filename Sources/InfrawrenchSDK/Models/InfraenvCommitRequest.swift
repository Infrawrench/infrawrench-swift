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

public struct InfraenvCommitRequest: Codable, Hashable, Sendable {
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

    public var installationId: Int
    /// `owner/name`.
    public var repo: String
    /// Path of the file in the repository. Defaults to `.infraenv` in the
    /// editors.
    public var path: String
    /// The branch to commit to, or to open the pull request against. Null means
    /// the default branch.
    public var branch: String?
    /// The `.infraenv` file's text.
    public var content: String
    /// The blob sha the file had when it was read, or null for a new file. A file
    /// changed since then answers 400 rather than being overwritten.
    public var sha: String?
    /// Commit straight to the branch, or to a new branch with a pull request.
    public var mode: Mode
    public var message: String?

    public init(
        installationId: Int,
        repo: String,
        path: String,
        branch: String? = nil,
        content: String,
        sha: String? = nil,
        mode: Mode,
        message: String? = nil
    ) {
        self.installationId = installationId
        self.repo = repo
        self.path = path
        self.branch = branch
        self.content = content
        self.sha = sha
        self.mode = mode
        self.message = message
    }
}
