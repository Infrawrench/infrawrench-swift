/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Idle commitments only: the provider's commands for inspecting and acting on
/// the commitment. Null for the other kinds.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct FindingRemediation: Codable, Hashable, Sendable {
    public struct Iac: Codable, Hashable, Sendable {
        public struct AttributeChange: Codable, Hashable, Sendable {
            public var attribute: String
            /// HCL rendering of the current value.
            public var from: String?
            /// HCL rendering of the target value.
            public var to: String?

            public init(
                attribute: String,
                from: String? = nil,
                to: String? = nil
            ) {
                self.attribute = attribute
                self.from = from
                self.to = to
            }
        }

        public var address: String
        public var stateLabel: String?
        public var attributeChanges: [AttributeChange]
        public var commands: [RemediationCommand]

        public init(
            address: String,
            stateLabel: String? = nil,
            attributeChanges: [AttributeChange],
            commands: [RemediationCommand]
        ) {
            self.address = address
            self.stateLabel = stateLabel
            self.attributeChanges = attributeChanges
            self.commands = commands
        }
    }

    /// In run order; empty when the plugin has nothing to offer for this finding.
    public var commands: [RemediationCommand]
    /// Every shell variable the commands reference, deduplicated.
    public var placeholders: [RemediationPlaceholder]
    /// Set when IaC reconciliation says Terraform manages the resource: edit the
    /// named block instead of running the CLI commands, which the next apply
    /// would revert.
    public var iac: Iac?

    public init(
        commands: [RemediationCommand],
        placeholders: [RemediationPlaceholder],
        iac: Iac? = nil
    ) {
        self.commands = commands
        self.placeholders = placeholders
        self.iac = iac
    }
}
