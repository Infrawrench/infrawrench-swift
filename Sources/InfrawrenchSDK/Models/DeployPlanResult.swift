/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DeployPlanResult: Codable, Hashable, Sendable {
    public struct Result2: Codable, Hashable, Sendable {
        public struct Error2: Codable, Hashable, Sendable {
            public var message: String
            public var stack: String?

            public init(
                message: String,
                stack: String? = nil
            ) {
                self.message = message
                self.stack = stack
            }
        }

        public var status: DeployStatus
        public var env: String
        public var plan: JSONValue?
        public var dockerfile: String?
        public var image: String?
        public var notes: [String]
        public var createdResources: [DeployCreatedResource]
        public var plannedChanges: [DeployPlannedChange]
        public var logs: [DeployRunLog]
        public var reachedStage: DeployStage?
        public var error: Error2?
        public var durationMs: Int

        public init(
            status: DeployStatus,
            env: String,
            plan: JSONValue? = nil,
            dockerfile: String? = nil,
            image: String? = nil,
            notes: [String],
            createdResources: [DeployCreatedResource],
            plannedChanges: [DeployPlannedChange],
            logs: [DeployRunLog],
            reachedStage: DeployStage? = nil,
            error: Error2? = nil,
            durationMs: Int
        ) {
            self.status = status
            self.env = env
            self.plan = plan
            self.dockerfile = dockerfile
            self.image = image
            self.notes = notes
            self.createdResources = createdResources
            self.plannedChanges = plannedChanges
            self.logs = logs
            self.reachedStage = reachedStage
            self.error = error
            self.durationMs = durationMs
        }
    }

    public var runId: String
    public var result: Result2

    public init(
        runId: String,
        result: Result2
    ) {
        self.runId = runId
        self.result = result
    }
}
