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

public struct PrCheckRepositoryInput: Codable, Hashable, Sendable {
    /// A GitHub App installation connected to the organization
    /// (`/github/status`).
    public var installationId: Int
    /// `owner/name`, as listed by `/github/repos`.
    public var repo: String
    /// Post checks on this repository's pull requests. Off keeps the settings.
    public var enabled: Bool
    /// Also keep one summary comment on each infrastructure pull request, edited
    /// in place on every push rather than re-posted. Needs the installation's
    /// `pull_requests: write`.
    public var commentEnabled: Bool
    /// Monthly cost increase, in the estimate's currency (USD for every provider
    /// that prices today), above which the check concludes `thresholdConclusion`.
    /// Null never trips. An increase that could not be priced never trips it
    /// either.
    public var costThreshold: Double?
    public var thresholdConclusion: PrCheckThresholdConclusion
    /// Path prefixes the check looks in, without leading or trailing slashes.
    /// Empty covers the whole repository.
    public var directories: [String]

    public init(
        installationId: Int,
        repo: String,
        enabled: Bool,
        commentEnabled: Bool,
        costThreshold: Double? = nil,
        thresholdConclusion: PrCheckThresholdConclusion,
        directories: [String]
    ) {
        self.installationId = installationId
        self.repo = repo
        self.enabled = enabled
        self.commentEnabled = commentEnabled
        self.costThreshold = costThreshold
        self.thresholdConclusion = thresholdConclusion
        self.directories = directories
    }
}
