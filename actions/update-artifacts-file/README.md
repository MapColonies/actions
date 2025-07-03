# Update Artifacts File Action

This GitHub Action builds and publishes a Helm chart to a specified registry and updates an `artifacts.json` metadata file using custom shell scripts. 

---

## ✨ What It Does

- Checks out the Helm chart repository
- Runs a script to update `artifacts.json` with the chart version and metadata
- Commits and pushes the updated metadata file to the repository


## 🛠 Inputs

| Name             | Description                                                                 | Required | Default         |
|------------------|-----------------------------------------------------------------------------|----------|-----------------|
| `scope`          | The directory name used as a logical scope for the artifact                | ✅ Yes   |             |
| `registry`       | Registry URL the artifact is pushed to (e.g., ACR address)                 | ✅ Yes   |                |
| `type`           | Type of artifact (`helm`, `docker`, etc.)                                  | ✅ Yes   |  |
| `artifact_name`  | Name of the artifact (e.g. `sftpgo`, `minio`)                              | ✅ Yes   |                |
| `artifact_tag`   | Tag or version of the artifact (e.g. `v1.2.3`, `latest`)                   | ✅ Yes   |                |
| `github_token`   | GitHub token with permission to commit & push changes                      | ✅ Yes   |                |



## 🚀 Usage

<!-- x-release-please-start-version -->

```yaml
- name: Update artifacts.json
  uses: MapColonies/shared-workflows/actions/update-artifacts-file@update-artifacts-file-v0.0.0
  with:
    scope: infra
    artifact_name: "sftpgo"
    artifact_tag: "v2.0.2"
    registry: ${{ secrets.ACR_URL }}
    github_token: ${{ secrets.GH_PAT }}
```
<!-- x-release-please-end-version -->
