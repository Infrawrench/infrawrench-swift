/*
 * InfrawrenchSDK v1.107.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.107.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiAccessConnectionsPreflightBody: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case vm
        case container
        case build
        case host
        case cluster
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "vm": self = .vm
            case "container": self = .container
            case "build": self = .build
            case "host": self = .host
            case "cluster": self = .cluster
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .vm: return "vm"
            case .container: return "container"
            case .build: return "build"
            case .host: return "host"
            case .cluster: return "cluster"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .vm,
            .container,
            .build,
            .host,
            .cluster,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var kind: Kind
    public var region: String?

    public init(
        kind: Kind,
        region: String? = nil
    ) {
        self.kind = kind
        self.region = region
    }
}

public struct CiAccessSshKeysUpdateBody: Codable, Hashable, Sendable {
    public var enabled: Bool
    /// The name pipelines use in `ssh-keys:`; unique in the organization.
    public var ciName: String
    /// Repositories (`owner/name`). Null: every repository the organization runs
    /// CI for.
    public var repos: [String]?
    /// Branches it holds for: globs separated by commas, where `*` stops at `/`
    /// and `**` does not (`main, release/*`). Null: every branch.
    public var branchPattern: String?

    public init(
        enabled: Bool,
        ciName: String,
        repos: [String]? = nil,
        branchPattern: String? = nil
    ) {
        self.enabled = enabled
        self.ciName = ciName
        self.repos = repos
        self.branchPattern = branchPattern
    }
}

public struct CiAccessSshKeysUpdateResult: Codable, Hashable, Sendable {
    public var lending: CiSshKeyLending?

    public init(
        lending: CiSshKeyLending? = nil
    ) {
        self.lending = lending
    }
}

public struct CiAccountsUpdateBody: Codable, Hashable, Sendable {
    public var enabled: Bool

    public init(
        enabled: Bool
    ) {
        self.enabled = enabled
    }
}

public struct CiRunsGetResult: Codable, Hashable, Sendable {
    public var runs: [CiRun]

    public init(
        runs: [CiRun]
    ) {
        self.runs = runs
    }
}

public struct CiRunsRetryBody: Codable, Hashable, Sendable {
    /// Run every `task-cache:` job instead of replaying a passing run's result.
    /// Results are saved again either way.
    public var noTaskCache: Bool?

    public init(
        noTaskCache: Bool? = nil
    ) {
        self.noTaskCache = noTaskCache
    }
}

public struct CiValuesUpdateBody: Codable, Hashable, Sendable {
    public var value: String

    public init(
        value: String
    ) {
        self.value = value
    }
}

/// `client.ci`
public final class CiNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.ci.access`
    public let access: CiAccessNamespace
    /// `client.ci.accounts`
    public let accounts: CiAccountsNamespace
    /// `client.ci.caches`
    public let caches: CiCachesNamespace
    /// `client.ci.runs`
    public let runs: CiRunsNamespace
    /// `client.ci.values`
    public let values: CiValuesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.access = CiAccessNamespace(transport: transport)
        self.accounts = CiAccountsNamespace(transport: transport)
        self.caches = CiCachesNamespace(transport: transport)
        self.runs = CiRunsNamespace(transport: transport)
        self.values = CiValuesNamespace(transport: transport)
    }

    /// CI status and the GitHub accounts that run it
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CiStatus {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// CI usage in a month: runs, compute and storage (caches and downloads)
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci/usage
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func usage(
        orgId: String? = nil,
        month: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CiUsage {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/usage",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("month", month)]
            ),
            options: options
        )
    }
}

/// `client.ci.access`
public final class CiAccessNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.ci.access.connections`
    public let connections: CiAccessConnectionsNamespace
    /// `client.ci.access.grants`
    public let grants: CiAccessGrantsNamespace
    /// `client.ci.access.sshKeys`
    public let sshKeys: CiAccessSshKeysNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.connections = CiAccessConnectionsNamespace(transport: transport)
        self.grants = CiAccessGrantsNamespace(transport: transport)
        self.sshKeys = CiAccessSshKeysNamespace(transport: transport)
    }

    /// What CI jobs may use: connections, resources and SSH keys
    ///
    /// Every connection whose provider can run CI jobs or lend its credentials,
    /// with what it is allowed; the resources granted to CI; and the SSH keys
    /// their owners lend. Nothing secret.
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci/access
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CiAccessOverview {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/access",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// What a resource can be granted to CI
    ///
    /// _Requires permission: `ci-access:write`._
    ///
    /// GET /api/org/{orgId}/ci/access/resource-outputs
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter resourceId: The resource's id.
    public func resourceOutputs(
        orgId: String? = nil,
        resourceId: String,
        options: RequestOptions? = nil
    ) async throws -> CiResourceOutputs {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/access/resource-outputs",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("resourceId", resourceId)]
            ),
            options: options
        )
    }
}

/// `client.ci.access.connections`
public final class CiAccessConnectionsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Check whether a connection can run cloud jobs of a kind
    ///
    /// Asks the provider without starting anything (a dry run or a permission
    /// test) and keeps the answer: what is missing and how to grant it. A failing
    /// check turns that kind off.
    ///
    /// _Requires permission: `ci-access:write`._
    ///
    /// POST /api/org/{orgId}/ci/access/connections/{accountId}/preflight
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func preflight(
        orgId: String? = nil,
        accountId: String,
        body: CiAccessConnectionsPreflightBody,
        options: RequestOptions? = nil
    ) async throws -> CiConnectionAccess {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ci/access/connections/{accountId}/preflight",
                pathParameters: ["orgId": orgId?.parameterValue, "accountId": accountId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Set what CI may do with a connection
    ///
    /// Run cloud jobs on it (kinds, limits, repositories, branches) and lend its
    /// credentials to jobs (repositories, branches). Turning cloud jobs on needs
    /// a passing permission check for every kind.
    ///
    /// _Requires permission: `ci-access:write`._
    ///
    /// PUT /api/org/{orgId}/ci/access/connections/{accountId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        accountId: String,
        body: CiConnectionAccessSettings,
        options: RequestOptions? = nil
    ) async throws -> CiConnectionAccess {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/ci/access/connections/{accountId}",
                pathParameters: ["orgId": orgId?.parameterValue, "accountId": accountId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.ci.access.grants`
public final class CiAccessGrantsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Grant CI jobs a resource's outputs
    ///
    /// Pipelines read them as `${{ resources.<ciName>.<output> }}` in `env:`, or
    /// all at once with `env-from: [<ciName>]`, read fresh for every run. Only
    /// for the listed repositories and branches, and never for a fork's pull
    /// request.
    ///
    /// _Requires permission: `ci-access:write`._
    ///
    /// POST /api/org/{orgId}/ci/access/grants
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CiResourceGrantInput,
        options: RequestOptions? = nil
    ) async throws -> CiResourceGrant {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ci/access/grants",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Remove a resource grant
    ///
    /// _Requires permission: `ci:write`._
    ///
    /// DELETE /api/org/{orgId}/ci/access/grants/{grantId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        grantId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/ci/access/grants/{grantId}",
                pathParameters: ["orgId": orgId?.parameterValue, "grantId": grantId.parameterValue]
            ),
            options: options
        )
    }

    /// Change a resource grant
    ///
    /// _Requires permission: `ci-access:write`._
    ///
    /// PUT /api/org/{orgId}/ci/access/grants/{grantId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        grantId: String,
        body: CiResourceGrantInput,
        options: RequestOptions? = nil
    ) async throws -> CiResourceGrant {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/ci/access/grants/{grantId}",
                pathParameters: ["orgId": orgId?.parameterValue, "grantId": grantId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.ci.access.sshKeys`
public final class CiAccessSshKeysNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Stop CI jobs using someone's SSH key
    ///
    /// _Requires permission: `ci:write`._
    ///
    /// DELETE /api/org/{orgId}/ci/access/ssh-keys/{sshKeyId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        sshKeyId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/ci/access/ssh-keys/{sshKeyId}",
                pathParameters: ["orgId": orgId?.parameterValue, "sshKeyId": sshKeyId.parameterValue]
            ),
            options: options
        )
    }

    /// Lend one of your SSH keys to CI jobs, or stop
    ///
    /// Only the key's owner can, and only for a key whose private half
    /// Infrawrench holds. Jobs name it in `ssh-keys:`.
    ///
    /// _Requires permission: `ssh-keys:write`._
    ///
    /// PUT /api/org/{orgId}/ci/access/ssh-keys/{sshKeyId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        sshKeyId: String,
        body: CiAccessSshKeysUpdateBody,
        options: RequestOptions? = nil
    ) async throws -> CiAccessSshKeysUpdateResult {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/ci/access/ssh-keys/{sshKeyId}",
                pathParameters: ["orgId": orgId?.parameterValue, "sshKeyId": sshKeyId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.ci.accounts`
public final class CiAccountsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Run CI, or stop running it, for a connected GitHub account
    ///
    /// _Requires permission: `ci:write`._
    ///
    /// PUT /api/org/{orgId}/ci/accounts/{installationId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        installationId: String,
        body: CiAccountsUpdateBody,
        options: RequestOptions? = nil
    ) async throws -> CiAccount {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/ci/accounts/{installationId}",
                pathParameters: ["orgId": orgId?.parameterValue, "installationId": installationId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.ci.caches`
public final class CiCachesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Clear a repository's CI caches
    ///
    /// Deletes every branch's and pull request's `cache:` and `task-cache:`
    /// entries of one repository. The next run of each job starts cold and saves
    /// again.
    ///
    /// _Requires permission: `ci:write`._
    ///
    /// DELETE /api/org/{orgId}/ci/caches/{installationId}/{repo}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        installationId: String,
        repo: String,
        options: RequestOptions? = nil
    ) async throws -> CiCacheCleared {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/ci/caches/{installationId}/{repo}",
                pathParameters: ["orgId": orgId?.parameterValue, "installationId": installationId.parameterValue, "repo": repo.parameterValue]
            ),
            options: options
        )
    }

    /// The caches CI keeps for each repository
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci/caches
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CiCaches {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/caches",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.ci.runs`
public final class CiRunsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Approve a fork's pull request commit
    ///
    /// Runs CI for this one commit of a pull request from a fork, without the
    /// organization's or repository's secrets. A later commit needs approving
    /// again.
    ///
    /// _Requires permission: `ci:approve`._
    ///
    /// POST /api/org/{orgId}/ci/runs/{runId}/approve
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func approve(
        orgId: String? = nil,
        runId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ci/runs/{runId}/approve",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue]
            ),
            options: options
        )
    }

    /// Cancel a CI run
    ///
    /// A queued run, or one waiting for its concurrency group, ends as cancelled
    /// at once. A running one is stopped by its runner, its running jobs as a
    /// timeout would stop them, and ends as cancelled once the runner reports it.
    /// A run waiting for approval is rejected instead.
    ///
    /// _Requires permission: `ci:approve`._
    ///
    /// POST /api/org/{orgId}/ci/runs/{runId}/cancel
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func cancel(
        orgId: String? = nil,
        runId: String,
        options: RequestOptions? = nil
    ) async throws -> CiRun {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ci/runs/{runId}/cancel",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue]
            ),
            options: options
        )
    }

    /// A short-lived link to a file a job kept for download
    ///
    /// The link is signed for this one file for 15 minutes (less when the file
    /// expires sooner) and is served by the CI proxy, not this API.
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci/runs/{runId}/download
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter job: The job's id, as the run's `jobs` list it.
    ///
    /// - Parameter path: The file's `path`, as the job's `downloads` list it.
    public func download(
        orgId: String? = nil,
        runId: String,
        job: String,
        path: String,
        options: RequestOptions? = nil
    ) async throws -> CiDownloadLink {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/runs/{runId}/download",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue],
                query: [QueryParameter("job", job), QueryParameter("path", path)]
            ),
            options: options
        )
    }

    /// List CI runs, newest first
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci/runs
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        status: CiRunStatus? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> CiRunsGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/runs",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("status", status), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }

    /// A CI run, with each job's output once it has finished
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci/runs/{runId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdCiRunsRunId(
        orgId: String? = nil,
        runId: String,
        options: RequestOptions? = nil
    ) async throws -> CiRunDetail {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/runs/{runId}",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue]
            ),
            options: options
        )
    }

    /// Decline to run a fork's pull request commit
    ///
    /// _Requires permission: `ci:approve`._
    ///
    /// POST /api/org/{orgId}/ci/runs/{runId}/reject
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func reject(
        orgId: String? = nil,
        runId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ci/runs/{runId}/reject",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue]
            ),
            options: options
        )
    }

    /// Run a finished CI run again
    ///
    /// Queues a new run of the same repository, commit, branch and event, linked
    /// to this one. A run waiting for approval is approved instead, and a fork's
    /// pull request still runs without secrets.
    ///
    /// _Requires permission: `ci:approve`._
    ///
    /// POST /api/org/{orgId}/ci/runs/{runId}/retry
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func retry(
        orgId: String? = nil,
        runId: String,
        body: CiRunsRetryBody,
        options: RequestOptions? = nil
    ) async throws -> CiRun {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ci/runs/{runId}/retry",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.ci.values`
public final class CiValuesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Remove a CI secret or variable
    ///
    /// _Requires permission: `ci:write`._
    ///
    /// DELETE /api/org/{orgId}/ci/values/{kind}/{name}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter kind: One of `secrets`, `variables`.
    ///
    /// - Parameter installationId: The GitHub App installation of an account that
    /// runs CI.
    ///
    /// - Parameter repo: A repository's name, for its own values. Omitted: the
    /// whole account's.
    public func delete(
        orgId: String? = nil,
        kind: String,
        name: String,
        installationId: Int,
        repo: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/ci/values/{kind}/{name}",
                pathParameters: ["orgId": orgId?.parameterValue, "kind": kind.parameterValue, "name": name.parameterValue],
                query: [QueryParameter("installationId", installationId), QueryParameter("repo", repo)]
            ),
            options: options
        )
    }

    /// List an account's or a repository's CI secrets and variables
    ///
    /// A repository's own value overrides the account's of the same name.
    /// Pipelines read them as `${{ secrets.NAME }}` and `${{ vars.NAME }}`; a
    /// fork's pull request gets variables but never secrets.
    ///
    /// _Requires permission: `ci:write`._
    ///
    /// GET /api/org/{orgId}/ci/values
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter installationId: The GitHub App installation of an account that
    /// runs CI.
    ///
    /// - Parameter repo: A repository's name, for its own values. Omitted: the
    /// whole account's.
    public func get(
        orgId: String? = nil,
        installationId: Int,
        repo: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CiValues {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/values",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("installationId", installationId), QueryParameter("repo", repo)]
            ),
            options: options
        )
    }

    /// Set a CI secret or variable
    ///
    /// _Requires permission: `ci:write`._
    ///
    /// PUT /api/org/{orgId}/ci/values/{kind}/{name}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter kind: One of `secrets`, `variables`.
    ///
    /// - Parameter installationId: The GitHub App installation of an account that
    /// runs CI.
    ///
    /// - Parameter repo: A repository's name, for its own values. Omitted: the
    /// whole account's.
    public func update(
        orgId: String? = nil,
        kind: String,
        name: String,
        installationId: Int,
        repo: String? = nil,
        body: CiValuesUpdateBody,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/ci/values/{kind}/{name}",
                pathParameters: ["orgId": orgId?.parameterValue, "kind": kind.parameterValue, "name": name.parameterValue],
                query: [QueryParameter("installationId", installationId), QueryParameter("repo", repo)],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
