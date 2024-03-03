# -- Function to create a configuration file
function Create-ConfigFile($filePath, $content) {
  New-Item -ItemType File -Path $filePath -Value $content -Force
}

# -- --- .dependabot/config.yml ---
$dependabotConfig = @"
version: 2
updates:
  - package-ecosystem: "pip"
    directory: "/" # Scan for requirements.txt
    schedule:
      interval: "weekly"
"@
Create-ConfigFile ".dependabot/config.yml" $dependabotConfig

# -- --- .github/workflows/secret-scanning.yml ---
$secretScanningWorkflow = @"
name: Secret Scanning

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  scan:
    runs-on: ubuntu-latest
    permissions:
      actions: read
      contents: read
      security-events: write

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
      - name: Initialize CodeQL
        uses: github/codeql-action/init@v2
        with:
          languages: python # Adjust if you use additional languages
      - name: Perform CodeQL Analysis
        uses: github/codeql-action/analyze@v2
"@
Create-ConfigFile ".github/workflows/secret-scanning.yml" $secretScanningWorkflow

# -- --- .github/workflows/codeql-analysis.yml
$codeqlAnalysisWorkflow = @"
name: CodeQL Analysis

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
  schedule:
    - cron: '0 0 * * 1' # Run weekly

jobs:
  analyze:
    name: Analyze
    runs-on: ubuntu-latest
    permissions:
      actions: read
      contents: read
      security-events: write

    steps:
    - name: Checkout repository
      uses: actions/checkout@v3
    - name: Initialize CodeQL
      uses: github/codeql-action/init@v2
      with:
        languages: python
    - name: Perform CodeQL Analysis
      uses: github/codeql-action/analyze@v2
"@
Create-ConfigFile ".github/workflows/codeql-analysis.yml" $codeqlAnalysisWorkflow

Write-Host "Repository configuration files created!"
