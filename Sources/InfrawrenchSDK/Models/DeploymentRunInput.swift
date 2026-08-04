/*
 * InfrawrenchSDK v0.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DeploymentRunInput: Codable, Hashable, Sendable {
    public struct Error2: Codable, Hashable, Sendable {
        public var message: String

        public init(
            message: String
        ) {
            self.message = message
        }
    }

    public var env: String
    public var status: DeployStatus
    public var repo: String?
    public var branch: String?
    public var gitSha: String?
    public var image: String?
    public var stage: DeployStage?
    public var notes: [String]?
    public var output: JSONValue?
    public var plan: JSONValue?
    public var createdResources: [DeployCreatedResource]?
    public var durationMs: Int?
    public var error: Error2?

    public init(
        env: String,
        status: DeployStatus,
        repo: String? = nil,
        branch: String? = nil,
        gitSha: String? = nil,
        image: String? = nil,
        stage: DeployStage? = nil,
        notes: [String]? = nil,
        output: JSONValue? = nil,
        plan: JSONValue? = nil,
        createdResources: [DeployCreatedResource]? = nil,
        durationMs: Int? = nil,
        error: Error2? = nil
    ) {
        self.env = env
        self.status = status
        self.repo = repo
        self.branch = branch
        self.gitSha = gitSha
        self.image = image
        self.stage = stage
        self.notes = notes
        self.output = output
        self.plan = plan
        self.createdResources = createdResources
        self.durationMs = durationMs
        self.error = error
    }
}
