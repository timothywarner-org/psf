# -- Base Path (Make sure this points to your existing repository root)
$basePath = "C:\users\timot\psf"

# -- New industries and example prompts
$newIndustries = @(
  @{ Name = "government"; Prompt = "Draft a press release announcing a new infrastructure initiative, highlighting its benefits to the community." }
  @{ Name = "military"; Prompt = "Write a tactical assessment report for a hypothetical military exercise, outlining strengths and weaknesses." }
  @{ Name = "sales"; Prompt = "Craft a compelling cold email outreach template for a B2B software product." }
  @{ Name = "it"; Prompt = "Generate troubleshooting steps for a common 'website not found' error." }
  @{ Name = "finance"; Prompt = "Explain the concept of return on investment (ROI) in simple terms." }
  @{ Name = "hr"; Prompt = "Write a job description for a social media manager, including key responsibilities and skills." }
)

# -- Create the folders and prompt files
foreach ($industry in $newIndustries) {
  $folderPath = Join-Path $basePath $industry.Name
  New-Item -ItemType Directory -Path $folderPath

  $promptFile = Join-Path $folderPath ($industry.Name + ".txt")
  New-Item -ItemType File -Path $promptFile -Value $industry.Prompt
}

Write-Host "New categories and prompt files added!"
