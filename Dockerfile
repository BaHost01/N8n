# Use Node 18 as base
FROM node:18-bullseye

# Set working directory
WORKDIR /app

# Install n8n globally
RUN npm install -g n8n

# Expose port for Render
EXPOSE 5678

# Default environment (you can override in render.yaml)
ENV N8N_PORT=5678
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin

# Start n8n
CMD ["n8n", "start"]
