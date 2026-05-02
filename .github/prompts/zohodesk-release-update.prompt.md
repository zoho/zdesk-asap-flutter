---
mode: agent
description: Update ZohoDesk Portal module dependencies and changelogs consistently across native packages
---

Use the instructions in `.github/agents/zohodesk-release-agent.md`.

Perform a coordinated release update across all portal modules in this workspace.

Inputs to ask for (if not provided):
- Target iOS SDK version (ZohoDeskPortal* podspec dependencies), if applicable
- Target Android SDK version (`com.zoho.desk:asap-*`), if applicable
- Target release version header for changelog (e.g., `2.6.2`)
- Main version for this pull request (single bump applied once per pull request)
- Any new features or APIs to implement
- Changelog notes for each update

Execution requirements:
1. Inspect current files before edits (no assumptions).
2. Update only requested dependency versions.
3. Update each affected module `pubspec.yaml` `version` once per pull request with matching SemVer impact:
	- patch dependency update => patch package bump
	- minor dependency update => minor package bump
	- major dependency update => major package bump
	- if iOS/Android differ, use highest level (major > minor > patch)
4. Do not bump main version per individual user request; apply it once for the pull request.
5. While updating main target version, sync the same version in target iOS podspec main version (`s.version`).
6. While updating main target version, also update subdependency versions that belong to the same dependency group and are included in the requested update scope.
7. Update changelog entries in all affected modules with concise, consistent wording.
8. Implement new APIs/features only if explicitly requested.
9. Keep release notes simple and user-facing.
10. Create a branch for the update.
	- Branch name must be the main target version.
11. Split commits in this order (when applicable):
	- iOS version update
	- Android version update
	- Flutter changes (short, clear message based on changes)
	- Changelog update
12. Push the branch to remote after commits (`git push` / `git push --set-upstream origin <branch>`).
13. Ask user confirmation before creating pull request.
14. Keep pull request title as the main version.
15. Keep pull request description as the changelog content for that main version.
16. Set pull request mergers as:
	- `vignesh-thillai-19833`
	- `balasubramanian-k-19828`
17. Set pull request reviewers as:
	- `prakash-vel-15296`
	- `vinoth-nv-15074`
	- `Copilot`
18. Verify no stale versions remain and consistency across all 9 modules, including iOS podspec main version sync and grouped subdependency version alignment.

Changelog wording defaults:
- `Integrated ASAP iOS SDK <version>` (if iOS SDK is updated)
- `Integrated ASAP Android SDK <version>` (if Android SDK is updated)
- For custom features, use clear, release-note style language

Return a compact summary of:
- Versions updated
- Main version used for pull request
- Files touched
- Changelog section updated
- Commit split performed
- Push status
- Pull request readiness and confirmation status
- Verification results
