#!/bin/bash

echo "🔧 Migrating SCSS to modern @use system..."

# 1. Rename ui-upgrade.scss to _ui-upgrade.scss
if [ -f "src/styles/ui/ui-upgrade.scss" ]; then
  mv src/styles/ui/ui-upgrade.scss src/styles/ui/_ui-upgrade.scss
  echo "✅ Renamed ui-upgrade.scss to _ui-upgrade.scss"
fi

# 2. Replace all @import with @use in all .scss files
find src -name "*.scss" | while read file; do
  sed -i 's|@import.*/variables.scss.*|@use "styles/variables" as *;|' "$file"
  sed -i 's|@import.*/ui/ui-upgrade.scss.*|@use "styles/ui/ui-upgrade" as *;|' "$file"
  sed -i 's|@import.*/animations.scss.*|@use "styles/ui/animations" as *;|' "$file"
done
echo "✅ Replaced all @import with @use"

# 3. Patch angular.json with includePaths
echo "🔁 Patching angular.json..."
jq '(.projects.portfolio.architect.build.options.stylePreprocessorOptions) = {
  "includePaths": ["src"]
}' angular.json > temp.json && mv temp.json angular.json
echo "✅ angular.json patched with includePaths"

# 4. Confirm success
echo "🎉 SCSS modern migration complete."
echo "🔁 Now run: ng serve"
