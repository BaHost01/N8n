# Use Node.js 20 (supported by latest n8n)
FROM node:20-bullseye

# Set working directory
WORKDIR /app

# Create n8n data folder
RUN mkdir -p /app/.n8n

# Install n8n locally (avoid global oclif issue)
RUN npm install n8n@latest --save

# Expose port for Render
EXPOSE 5678

# Default environment vars (you can override in render.yaml)
ENV N8N_PORT=5678
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=changeme

# Start n8n via npx (runs from local node_modules)
CMD ["npx", "n8n", "start"]

