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

public struct PrCheckPreview: Codable, Hashable, Sendable {
    public var report: PrCheckReport?
    public var conclusion: PrCheckConclusion?
    public var title: String
    /// The check run summary, as GitHub renders it.
    public var markdown: String

    public init(
        report: PrCheckReport? = nil,
        conclusion: PrCheckConclusion? = nil,
        title: String,
        markdown: String
    ) {
        self.report = report
        self.conclusion = conclusion
        self.title = title
        self.markdown = markdown
    }
}
