# Update Angular Material imports in TypeScript files
Get-ChildItem -Recurse -Include *.ts | Where-Object { $_.FullName -notlike "*node_modules*" } | ForEach-Object {
    if ($_.Extension -eq ".ts") {
        try {
            $content = Get-Content $_.FullName -Raw
            $newContent = $content `
                -replace "import { MatDialogModule } from '@angular/material';", "import { MatDialogModule } from '@angular/material/dialog';" `
                -replace "import { MatToolbarModule } from '@angular/material';", "import { MatToolbarModule } from '@angular/material/toolbar';" `
                -replace "import { MatListModule } from '@angular/material';", "import { MatListModule } from '@angular/material/list';" `
                -replace "import { MatButtonModule } from '@angular/material';", "import { MatButtonModule } from '@angular/material/button';" `
                -replace "import { MatChipsModule } from '@angular/material';", "import { MatChipsModule } from '@angular/material/chips';"
                
            if ($newContent -ne $content) {
                $newContent | Set-Content $_.FullName
                Write-Host "Updated Angular Material imports in file: $($_.FullName)"
            }
        } catch {
            Write-Host "Error processing file: $($_.FullName) - $_"
        }
    } else {
        Write-Host "Skipping non-TypeScript file: $($_.FullName)"
    }
}
