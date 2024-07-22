Get-ChildItem -Recurse -Include *.ts | ForEach-Object {
    if ($_.Extension -eq ".ts") {  # Ensure the file is a TypeScript file
        try {
            $content = Get-Content $_.FullName -Raw
            if (-not [string]::IsNullOrWhiteSpace($content)) {  # Check if the content is not empty
                $newContent = $content -replace "Observable.throw", "throwError"  # Replace Observable.throw with throwError
                if ($newContent -ne $content) {  # Check if any changes were made
                    $newContent | Set-Content $_.FullName  # Write changes back to the file
                    Write-Host "Updated RxJS usage in file: $($_.FullName)"
                }
            } else {
                Write-Host "Skipping empty file: $($_.FullName)"
            }
        } catch {
            Write-Host "Error processing file: $($_.FullName) - $_"
        }
    } else {
        Write-Host "Skipping non-TypeScript file: $($_.FullName)"
    }
}
