# pysetup: Python Project Setup Script

`pysetup` is a shell script that automates the process of setting up a new Python project. It streamlines the initial setup phase, allowing you to jump straight into development.

## What pysetup does

When you run `pysetup`, it performs the following actions:

1. Creates a new project directory with the specified name
2. Sets up a Python virtual environment (.venv) within the project directory
3. Creates a `requirements.txt` file with basic packages (ipykernel and jupyter)
4. Generates a `.gitignore` file tailored for Python projects, including:
   - Python bytecode files and caches
   - Virtual environment directories
   - Jupyter Notebook checkpoints
   - .env files for environment variables
   - Common IDE-specific directories
   - OS-generated files
5. Activates the virtual environment
6. Installs the packages listed in `requirements.txt`
7. Offers to open the project in Cursor IDE (if installed)

If the specified project directory already exists, `pysetup` will ask if you want to open it in Cursor IDE instead of creating a new setup.

## Installation

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/pysetup.git
   ```

2. Create a scripts directory in your home folder (if it doesn't exist):
   ```
   mkdir -p ~/.scripts
   ```

3. Move the script to your scripts directory:
   ```
   mv pysetup/pysetup.sh ~/.scripts/pysetup.sh
   ```

4. Make the script executable:
   ```
   chmod +x ~/.scripts/pysetup.sh
   ```

5. Add the following line to your `.zshrc` or `.bashrc`:
   ```
   source ~/.scripts/pysetup.sh
   ```

6. Reload your shell configuration:
   ```
   source ~/.zshrc  # or source ~/.bashrc for Bash
   ```

## Usage

To create a new Python project:

```
pysetup your_project_name
```

If the project directory already exists, the script will ask if you want to open it in Cursor IDE.

## Customization

You can easily customize the script to fit your needs:

- Modify the default packages in the `requirements.txt` creation section
- Change the IDE launch command if you prefer an IDE other than Cursor
- Add additional setup steps as needed

To customize, edit the `~/.scripts/pysetup.sh` file.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.