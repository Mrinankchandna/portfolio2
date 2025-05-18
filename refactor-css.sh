#!/bin/bash

echo "🔁 Starting Angular SCSS refactor..."

# 1. Create the new styles directory
mkdir -p src/styles/components

# 2. List of components (based on folder names)
COMPONENTS_DIR="src/app/components"
COMPONENTS=$(find "$COMPONENTS_DIR" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)

# 3. Move SCSS files & update .ts files
for comp in $COMPONENTS; do
  scss_file="$COMPONENTS_DIR/$comp/${comp}.component.scss"
  ts_file="$COMPONENTS_DIR/$comp/${comp}.component.ts"
  new_scss_path="src/styles/components/${comp}.scss"

  if [ -f "$scss_file" ]; then
    echo "🔄 Moving $scss_file -> $new_scss_path"
    mv "$scss_file" "$new_scss_path"
  else
    echo "⚠️ No SCSS file found for $comp"
    continue
  fi

  if [ -f "$ts_file" ]; then
    echo "📝 Updating import path in $ts_file"
    sed -i "s|styleUrls: \['.*.scss'\]|styleUrls: ['../../../styles/components/${comp}.scss']|g" "$ts_file"
  else
    echo "⚠️ No TypeScript file found for $comp"
  fi
done

# 4. Create global SCSS files
cat > src/styles/variables.scss <<EOF
:root {
  --bg: #121212;
  --fg: #ffffff;
  --accent: #03dac6;
  --font-main: 'Poppins', sans-serif;

  --space-xs: 0.5rem;
  --space-sm: 1rem;
  --space-md: 2rem;
  --space-lg: 4rem;
}
EOF

cat > src/styles/layout.scss <<EOF
.container {
  width: min(90%, 1200px);
  margin-inline: auto;
}

.flex {
  display: flex;
  gap: var(--space-md);
}

.grid {
  display: grid;
  gap: var(--space-md);
}

.grid-2 {
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
}
EOF

echo ""
echo "🎉 SCSS refactor complete!"
echo "📁 All SCSS files moved to: src/styles/components/"
echo "📄 Imports updated in each component .ts file."
echo "🛠️ Global SCSS created: src/styles/variables.scss and layout.scss"
