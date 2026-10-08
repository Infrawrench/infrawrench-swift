/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DashboardNotificationSendResult: Codable, Hashable, Sendable {
    public struct Slack: Codable, Hashable, Sendable {
        public var attempted: Int
        public var succeeded: Int

        public init(
            attempted: Int,
            succeeded: Int
        ) {
            self.attempted = attempted
            self.succeeded = succeeded
        }
    }

    public struct Teams: Codable, Hashable, Sendable {
        public var attempted: Int
        public var succeeded: Int

        public init(
            attempted: Int,
            succeeded: Int
        ) {
            self.attempted = attempted
            self.succeeded = succeeded
        }
    }

    public struct Email: Codable, Hashable, Sendable {
        public var attempted: Int
        public var succeeded: Int

        public init(
            attempted: Int,
            succeeded: Int
        ) {
            self.attempted = attempted
            self.succeeded = succeeded
        }
    }

    public var attempted: Int
    public var succeeded: Int
    public var slack: Slack
    public var teams: Teams
    public var email: Email
    /// Whether a PDF was rendered and sent.
    public var pdfAttached: Bool
    /// Slack channels that also received the PDF. Lower than `slack.succeeded`
    /// when the Slack install predates the `files:write` scope.
    public var slackFilesUploaded: Int

    public init(
        attempted: Int,
        succeeded: Int,
        slack: Slack,
        teams: Teams,
        email: Email,
        pdfAttached: Bool,
        slackFilesUploaded: Int
    ) {
        self.attempted = attempted
        self.succeeded = succeeded
        self.slack = slack
        self.teams = teams
        self.email = email
        self.pdfAttached = pdfAttached
        self.slackFilesUploaded = slackFilesUploaded
    }
}
