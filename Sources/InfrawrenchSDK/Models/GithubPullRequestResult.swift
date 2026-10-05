/*
 * InfrawrenchSDK v1.55.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.55.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct GithubPullRequestResult: Codable, Hashable, Sendable {
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

    public var pullRequest: PullRequest
    public var link: GithubIssueLink?

    public init(
        pullRequest: PullRequest,
        link: GithubIssueLink? = nil
    ) {
        self.pullRequest = pullRequest
        self.link = link
    }
}
