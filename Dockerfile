# Use the base image from ghcr.io/pterodactyl/panel:v1.11.5
FROM ghcr.io/pterodactyl/panel:v1.11.5

# Copy the local entrypoint.sh file to the image
COPY ./permissionfix-entrypoint.sh /app/.github/docker/entrypoint.sh

# Set the correct permissions for the entrypoint.sh file
RUN chmod +x /app/.github/docker/entrypoint.sh

# Expose ports 80 and 443
EXPOSE 80 443

# Set the entrypoint and default command
ENTRYPOINT [ "/bin/ash", "/app/.github/docker/entrypoint.sh" ]
CMD [ "supervisord", "-n", "-c", "/etc/supervisord.conf" ]
