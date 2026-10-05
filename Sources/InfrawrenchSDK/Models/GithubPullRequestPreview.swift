/*
 * InfrawrenchSDK v1.58.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.58.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum GithubPullRequestPreview: Codable, Hashable, Sendable {
    public struct GithubPullRequestPreviewObject: Codable, Hashable, Sendable {
        public var eligible: Bool
        public var repo: GithubRepoRef?
        public var baseBranch: String
        public var path: String
        public var terraformAddress: String
        public var title: String
        public var body: String
        /// Unified diff of the one file the PR changes.
        public var diff: String

        public init(
            eligible: Bool,
            repo: GithubRepoRef? = nil,
            baseBranch: String,
            path: String,
            terraformAddress: String,
            title: String,
            body: String,
            diff: String
        ) {
            self.eligible = eligible
            self.repo = repo
            self.baseBranch = baseBranch
            self.path = path
            self.terraformAddress = terraformAddress
            self.title = title
            self.body = body
            self.diff = diff
        }
    }

    public struct GithubPullRequestPreviewObject2: Codable, Hashable, Sendable {
        public var eligible: Bool
        public var reason: String

        public init(
            eligible: Bool,
            reason: String
        ) {
            self.eligible = eligible
            self.reason = reason
        }
    }

    case object(GithubPullRequestPreviewObject)
    case object2(GithubPullRequestPreviewObject2)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(GithubPullRequestPreviewObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(GithubPullRequestPreviewObject2.self) {
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
