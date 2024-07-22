# Path to the shared.module.ts file
$filePath = "C:\Users\Gwen\lafs-web\src\app\shared\shared.module.ts"

# Check if the file exists
if (Test-Path $filePath) {
    try {
        # Read the content of the file
        $content = Get-Content $filePath -Raw

        # Update the import statements
        $newContent = $content `
            -replace "import { MatDialogModule } from '@angular/material';", "import { MatDialogModule } from '@angular/material/dialog';" `
            -replace "import { MatToolbarModule } from '@angular/material';", "import { MatToolbarModule } from '@angular/material/toolbar';" `
            -replace "import { MatListModule } from '@angular/material';", "import { MatListModule } from '@angular/material/list';" `
            -replace "import { MatButtonModule } from '@angular/material';", "import { MatButtonModule } from '@angular/material/button';" `
            -replace "import { MatChipsModule } from '@angular/material';", "import { MatChipsModule } from '@angular/material/chips';"

        # Check if any changes were made
        if ($newContent -ne $content) {
            # Write the updated content back to the file
            $newContent | Set-Content $filePath
            Write-Host "Updated Angular Material imports in shared.module.ts"
        } else {
            Write-Host "No changes needed in shared.module.ts"
        }
    } catch {
        Write-Host "Error processing file: $filePath - $_"
    }
} else {
    Write-Host "File not found: $filePath"
}
