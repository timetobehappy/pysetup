#!/bin/bash

pysetup() {
    if [ -z "$1" ]; then
        echo "Usage: pysetup <project_name>"
        return 1
    fi

    project_name="$1"
    
    # Check if directory already exists
    if [ -d "$project_name" ]; then
        echo "Directory '$project_name' already exists."
        echo -n "Do you want to open it in Cursor? (y/n): "
        read choice </dev/tty
        case "${choice:0:1}" in 
          y|Y ) cd "$project_name"
                if command -v cursor &> /dev/null; then
                    echo "Launching Cursor IDE..."
                    cursor .
                else
                    echo "Cursor IDE not found. Please install Cursor or launch your preferred IDE manually."
                fi
                return 0;;
          * ) echo "Operation cancelled."
              return 1;;
        esac
    fi
    
    # Create project directory and navigate to it
    mkdir "$project_name" && cd "$project_name"
    
    # Create virtual environment
    python3 -m venv .venv
    
    # Create requirements.txt
    echo -e "ipykernel\njupyter" > requirements.txt
    
    # Create .gitignore file
    cat << EOF > .gitignore
# Python
__pycache__/
*.py[cod]
*$py.class

# Virtual Environment
.venv/
venv/
ENV/

# Jupyter Notebook
.ipynb_checkpoints

# Environment variables
.env

# IDEs
.vscode/
.idea/

# OS generated files
.DS_Store
Thumbs.db
EOF

    # Activate virtual environment
    source .venv/bin/activate
    
    # Install requirements
    pip install -r requirements.txt
    
    echo "Python project '$project_name' has been set up!"
    echo "Virtual environment is activated. Use 'deactivate' to exit."
    echo "To reactivate later, use 'source .venv/bin/activate' from the project directory."
    echo "A .gitignore file has been created with common Python ignores, including .env"
    
    # Launch Cursor IDE
    if command -v cursor &> /dev/null; then
        echo "Launching Cursor IDE..."
        cursor .
    else
        echo "Cursor IDE not found. Please install Cursor or launch your preferred IDE manually."
    fi
}