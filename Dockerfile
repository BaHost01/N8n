# Use Node.js 18 as base
FROM node:18-bullseye

# Set working directory
WORKDIR /app

# Copy package files (none needed, but keeps Docker happy)
RUN mkdir -p /app/.n8n

# Install n8n locally instead of globally (fixes oclif bug)
RUN npm install n8n@latest --save

# Expose port for Render
EXPOSE 5678

# Environment vars (can override in render.yaml)
ENV N8N_PORT=5678
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin

# Start n8n via npx (runs from local node_modules)
CMD ["npx", "n8n", "start"]
