# Privacy & Security

This document outlines the privacy and security practices for the Dangling Dice Calculator Frontend repository.

## Repository Purpose

This is a **public, open-source repository** containing only the UI frontend of the Dangling Dice Calculator application. It is intended for:
- Educational purposes
- Community contributions to the UI/UX
- Portfolio demonstration
- Open-source collaboration

## What This Repository Does NOT Contain

This public repository intentionally excludes:

### Proprietary Code
- ❌ AI/ML model integration and proprietary algorithms
- ❌ Cloud backend infrastructure code
- ❌ Payment and subscription processing logic
- ❌ Internal business logic

### Sensitive Information
- ❌ API keys or credentials (real or dummy)
- ❌ Firebase configurations and credentials
- ❌ Database connection strings
- ❌ Service account keys
- ❌ Signing keys or keystores

### Third-Party Integrations
- ❌ Firebase (authentication, database, analytics, functions)
- ❌ Google Generative AI / Gemini API code
- ❌ RevenueCat (payment processing)
- ❌ Google Mobile Ads
- ❌ Internal analytics and tracking

## What This Repository DOES Contain

This public repository includes:

### UI Components
- ✅ Flutter screens and widgets
- ✅ Material Design implementations
- ✅ User interface layouts
- ✅ Responsive design patterns

### Core Business Logic (Public)
- ✅ Basic calculator math engine
- ✅ Expression parsing and evaluation
- ✅ Local state management (Riverpod)
- ✅ History tracking (local only)

### Documentation
- ✅ Setup and installation guides
- ✅ Contributing guidelines
- ✅ Code examples and tutorials
- ✅ Architecture documentation

### Testing
- ✅ Unit tests for public services
- ✅ Widget tests for UI
- ✅ Test fixtures and mocks

## Security Practices

### Code Review
- All pull requests are reviewed for:
  - Hardcoded credentials
  - Proprietary code patterns
  - Security vulnerabilities
  - Sensitive information leaks

### Automated Checks
GitHub Actions workflows verify:
- No Firebase imports or code
- No API keys or credentials
- No proprietary dependencies
- Code quality and style compliance

### Dependency Management
- Only public, open-source dependencies
- Regular dependency updates
- Security vulnerability scanning (via Dependabot)

### .gitignore Configuration
Prevents accidental commits of:
- Environment files (`.env`, `.env.*`)
- Build artifacts
- IDE configurations
- Generated files

## If You Find a Security Issue

If you discover a security vulnerability in this repository, please:

1. **Do NOT open a public issue**
2. **Do NOT post in discussions**
3. **Email the maintainer** with details

The issue will be reviewed and fixed promptly. We appreciate responsible disclosure.

## Privacy

### Data Collected by This App
The calculator runs entirely locally on your device:
- ❌ No data is sent to external servers
- ❌ No analytics or tracking
- ❌ No user identification
- ❌ No personal information collection

### Local Storage Only
- Calculation history is stored locally on your device
- User preferences are stored in Shared Preferences
- Nothing is synced to the cloud in this public version

### Complete AI Version
The **private repository** contains the full-featured AI-powered version with optional cloud features. Those features are NOT included in this public repository.

## Third-Party Dependencies

This project uses only well-maintained, open-source dependencies:

### Approved Dependencies
- `flutter` - Flutter SDK (Google)
- `riverpod` - State management
- `go_router` - Navigation
- `math_expressions` - Math parsing
- `shared_preferences` - Local storage
- `google_fonts` - Font library

All dependencies can be reviewed in [pubspec.yaml](pubspec.yaml).

## Reporting Security Vulnerabilities

If you find a dependency with a known vulnerability:

1. Check the dependency's GitHub security advisories
2. Open a pull request to update the dependency
3. Include the security advisory link in the PR description

## License & Attribution

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

### Proprietary Notice
The complete, AI-powered version of this application is proprietary and not included in this public repository. The private repository is maintained separately and contains additional features and business logic.

### Use of This Code
You are free to:
- ✅ Use this code as reference material
- ✅ Fork and modify for personal projects
- ✅ Contribute improvements via pull requests
- ✅ Include in portfolio/resume

You should:
- ✅ Give proper attribution
- ✅ Follow the MIT License terms
- ✅ Respect intellectual property rights

## Questions?

For security questions or concerns:
- Open an issue on GitHub (for non-security issues)
- Email the maintainer (for security concerns)
- Check existing documentation and FAQs

---

**Last Updated:** July 2026

For more information about this repository:
- [README.md](README.md)
- [Contributing Guidelines](CONTRIBUTING.md)
- [Sync Guidelines](SYNC_GUIDELINES.md)
