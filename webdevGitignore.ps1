# Combine required .gitignore files into one
# Powershell v3+ is required
# (c) 2016 mao  https://github.com/maoizm/gitignore

$globalExcludeFilenames = "Linux", "Windows", "JetBrains" 
$webdevExcludeFilenames = "Sass", "Node", "Composer", "Joomla"

New-Item -ItemType Directory -Force -Path ".\Dist"

$result = ((($globalExcludeFilenames | % {"Global\" + $_}) + $webdevExcludeFilenames) | % {$_ + ".gitignore"} | % {"`r`n"*3 + '### ' + $_ + "`r`n"*2 + (gc -Raw $_)})
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
[IO.File]::WriteAllLines(".\Dist\.gitignore", $result, $Utf8NoBomEncoding)
