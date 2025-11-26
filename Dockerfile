# Use lightweight Nginx image
FROM nginx:alpine

# Copy HTML file to Nginx default folder
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Run Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]


