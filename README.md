# Secure WordPress Setup with Wordfence

This repository contains scripts and configurations for setting up a secure WordPress installation with Wordfence security plugin.

## Features

- Latest WordPress version (currently 6.7.1)
- Wordfence security plugin
- Secure Apache configurations
- Automated installation process
- Security-focused wp-config.php
- WP-CLI integration

## Prerequisites

- Debian/Ubuntu-based system
- Root access
- Internet connection

## Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/wordpress-secure-setup.git
cd wordpress-secure-setup
```

2. Make the installation script executable:
```bash
chmod +x scripts/install.sh
```

3. Run the installation script:
```bash
sudo ./scripts/install.sh
```

## Security Features

- Automatic WordPress core updates enabled
- File editing disabled in admin panel
- SSL forced for admin area
- Secure Apache configurations
- Wordfence security plugin
- Protected sensitive files
- Security headers configured

## Post-Installation

After installation:

1. Change the default admin password
2. Complete Wordfence setup wizard
3. Configure Wordfence firewall
4. Enable two-factor authentication
5. Set up regular backups
6. Configure email alerts

## Configuration

You can modify the following files to customize your installation:

- `scripts/install.sh`: Installation variables and process
- `config/wp-config.php`: WordPress configuration
- `config/wordpress.conf`: Apache virtual host configuration

## Security Notes

- Default credentials are for testing only
- Change all passwords after installation
- Keep WordPress and plugins updated
- Monitor Wordfence security alerts
- Regularly backup your site

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

MIT License