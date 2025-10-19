# Use the official n8n Docker image
FROM n8nio/n8n

# Expose port
EXPOSE 5678

# Default command
CMD ["n8n", "start"]
