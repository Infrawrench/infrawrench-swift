/*
 * InfrawrenchSDK v1.117.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.117.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Lists AND-compose; values within a list OR. An absent list does not filter.
/// `commitmentTypes` and `commitmentIds` narrow the commitment side (covered
/// usage and unused fees) only: uncovered usage stays in, because it is the rest
/// of the coverage denominator.
public struct CommitmentReportFilters: Codable, Hashable, Sendable {
    /// Plugin ids, as `report-options` lists them (`aws`, `azure`).
    public var providers: [String]?
    /// Narrows the commitment side to holdings of these kinds.
    public var commitmentTypes: [CommitmentReportKind]?
    /// Provider service names, as `report-options` lists them.
    public var services: [String]?
    /// Connected account ids.
    public var accountIds: [String]?
    /// Provider regions, as `report-options` lists them.
    public var regions: [String]?
    /// Provider-native commitment ids, as `report-options` lists them. Narrows
    /// the commitment side to those holdings.
    public var commitmentIds: [String]?

    public init(
        providers: [String]? = nil,
        commitmentTypes: [CommitmentReportKind]? = nil,
        services: [String]? = nil,
        accountIds: [String]? = nil,
        regions: [String]? = nil,
        commitmentIds: [String]? = nil
    ) {
        self.providers = providers
        self.commitmentTypes = commitmentTypes
        self.services = services
        self.accountIds = accountIds
        self.regions = regions
        self.commitmentIds = commitmentIds
    }
}
