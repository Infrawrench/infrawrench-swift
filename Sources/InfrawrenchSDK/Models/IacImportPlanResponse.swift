/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IacImportPlanResponse: Codable, Hashable, Sendable {
    public struct Exported: Codable, Hashable, Sendable {
        public var resourceId: String
        public var address: String
        public var importId: String?

        public init(
            resourceId: String,
            address: String,
            importId: String? = nil
        ) {
            self.resourceId = resourceId
            self.address = address
            self.importId = importId
        }
    }

    public struct Unsupported: Codable, Hashable, Sendable {
        public var resourceId: String
        public var displayName: String
        public var reason: String

        public init(
            resourceId: String,
            displayName: String,
            reason: String
        ) {
            self.resourceId = resourceId
            self.displayName = displayName
            self.reason = reason
        }
    }

    /// `import` blocks followed by the generated resource stanzas.
    public var hcl: String
    public var exported: [Exported]
    public var unsupported: [Unsupported]

    public init(
        hcl: String,
        exported: [Exported],
        unsupported: [Unsupported]
    ) {
        self.hcl = hcl
        self.exported = exported
        self.unsupported = unsupported
    }
}
