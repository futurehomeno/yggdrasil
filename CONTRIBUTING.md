# Contributing to Yggdrasil

Thank you for considering contributing to Yggdrasil! We welcome contributions of all kinds, including bug fixes, feature implementations, documentation improvements, and more.

## Getting Started

1. **Fork the Repository**: Start by forking the repository to your GitHub account.
2. **Clone the Repository**: Clone your fork to your local machine:
   ```bash
   git clone https://github.com/your-username/yggdrasil.git
   ```
3. **Set Upstream Remote**: Add the original repository as an upstream remote:
   ```bash
   git remote add upstream https://github.com/futurehomeno/yggdrasil.git
   ```
4. **Set Up FVM**: Install and configure Flutter Version Management (FVM):
   - Install FVM by following the instructions at [FVM Installation Guide](https://fvm.app/docs/getting_started/installation).
   - Use FVM to install the required Flutter version for the project:
     ```bash
     fvm install
     ```
   - Set the Flutter version for the project:
     ```bash
     fvm use
     ```
   - Use FVM's Flutter wrapper for all Flutter commands:
     ```bash
     fvm flutter <command>
     ```

## Development Workflow

1. **Create a Branch**: Create a new branch for your changes. The branch name should follow the format `username/feature-or-bugfix-name`:
   ```bash
   git checkout -b your-username/feature-or-bugfix-name
   ```
2. **Make Changes**: Implement your changes in the codebase.
   - If you are creating a new widget:
     - Follow the design guidelines as described on [Supernova](https://steady-weasel-purple.supernova-docs.io/latest/get-started/welcome-CNGiUMqM).
     - Create a Figma design for the widget.
     - Make use of the existing semantic design tokens, both in Figma and in the codebase.
   - Ensure all new widgets or features are implemented in the demo app for testing and demonstration purposes.
   - Minimize unnecessary breaking changes for users of the library. Breaking changes should only be considered if there is no other alternative. Internal breaking changes within the library itself are less critical but should still be handled thoughtfully.
   - Do not use semantic tokens directly in widgets. Instead, add them to a theme under: `yggdrasil/lib/src/theme/<your_widget_name>/`
   - If you add any theme properties, run the build runner to generate the necessary files:
     ```bash
     fvm dart run build_runner build --delete-conflicting-outputs
     ```
   - Consider the performance of what you are building. Avoid introducing unnecessary complexity or inefficiencies.
   - Use existing conventions where applicable:
     - Use `YgStyle` and `YgState` to supply animated styling of variants and properties, instead of implementing your own animation logic.
     - Use `YgButtonBase` if you want to add a new type of button, rather than creating one from scratch.
     - etc.
3. **Test Your Changes**: Ensure your changes work as expected. Since we do not currently have automated tests for widgets:
   - Test your changes manually.

4. **Commit Changes**: Commit your changes with a descriptive commit message:
   ```bash
   git commit -m "Description of the change"
   ```
5. **Push Changes**: Push your branch to your fork:
   ```bash
   git push origin feature-or-bugfix-name
   ```

## Submitting a Pull Request

1. **Open a Pull Request**: Go to the original repository and open a pull request from your branch.
   - Open your pull request as a draft.
   - Perform a self-review and ensure you are fully satisfied with your pull request before marking it as ready to review.
   - Add a comment to your pull request with an image or a video demonstrating your changes, depending on which is more appropriate.
2. **Describe Your Changes**: Provide a clear description of your changes and why they are necessary.
   - The PR description must follow the pull request template, including valid tags as specified there.
3. **Address Feedback**: Be responsive to feedback from maintainers and make necessary updates.

## Code Style

- Follow the existing code style and conventions.
- Use meaningful variable and function names.
- Write clear and concise comments where necessary.
- Ensure your code adheres to DCM lint and style rules:
  - If you have access to DCM, we recommend using it to validate your code.
  - If you do not have access to DCM (as it is a paid tool), use the GitHub Action logs to identify and fix any issues with your code.

## Reporting Issues

If you encounter a bug or have a feature request, please open an issue in the repository. Provide as much detail as possible, including steps to reproduce the issue if applicable.

## Community Guidelines

- Be respectful and inclusive.
- Provide constructive feedback.
- Follow the [Code of Conduct](CODE_OF_CONDUCT.md).

Thank you for contributing to Yggdrasil!
