#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}


# Check if the script is run with sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with sudo privileges."
    exit 1
fi


# Install Python Linter (py_compile)
echo "Checking if Python Linter (yamllint) is installed..."
if command_exists yamllint; then
    echo "yamllint is already installed."
else
    echo "Installing Python Linter (yamllint)..."
    pip install yamllint
fi

# Install ESLint (for JS/JSX, TS/TSX)
echo "Checking if ESLint is installed..."
if command_exists eslint; then
    echo "ESLint is already installed."
else
    echo "Installing ESLint..."
    npm install -g eslint
fi

# Install TypeScript Linter (tsc)
echo "Checking if TypeScript is installed..."
if command_exists tsc; then
    echo "TypeScript is already installed."
else
    echo "Installing TypeScript..."
    npm install -g typescript
fi

# Install Tidy (HTML Linter)
echo "Checking if Tidy (HTML Linter) is installed..."
if command_exists tidy; then
    echo "Tidy is already installed."
else
    echo "Installing Tidy (HTML Linter)..."
    apt-get install tidy  # For Debian-based systems
    # brew install tidy-html5  # For macOS
fi

# Install YAML Linter (yamllint)
echo "Checking if YAML Linter (yamllint) is installed..."
if command_exists yamllint; then
    echo "yamllint is already installed."
else
    echo "Installing YAML Linter (yamllint)..."
    pip install yamllint
fi

# Install Stylelint (CSS Linter)
echo "Checking if Stylelint is installed..."
if command_exists stylelint; then
    echo "Stylelint is already installed."
else
    echo "Installing Stylelint..."
    npm install -g stylelint
fi

# Install Java Linter (javac)
echo "Checking if javac is installed..."
if command_exists javac; then
    echo "javac is already installed."
else
    echo "Installing Java Linter (javac)..."
    apt-get install default-jdk  # Install Java Development Kit
fi

# Install Hadolint (Dockerfile Linter)
echo "Checking if Hadolint is installed..."
if command_exists hadolint; then
    echo "Hadolint is already installed."
else
    echo "Installing Dockerfile Linter (Hadolint)..."
    # For Linux (64-bit)
    curl -Lo hadolint https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64
    chmod +x hadolint
    mv hadolint /usr/local/bin/

    # brew install hadolint      # For macOS
fi

# Install Jenkinsfile Linter (groovy)
echo "Checking if Groovy is installed for Jenkinsfile..."
if command_exists groovy; then
    echo "Groovy is already installed."
else
    echo "Installing Groovy (for Jenkinsfile)..."
    apt-get install groovy  # For Linux
    # brew install groovy        # For macOS
fi

# Install ShellCheck (Shell Script Linter)
echo "Checking if ShellCheck is installed..."
if command_exists shellcheck; then
    echo "ShellCheck is already installed."
else
    echo "Installing ShellCheck..."
    apt install shellcheck  # For Linux
    # brew install shellcheck    # For macOS
fi

# Install Markdown Linter (markdownlint)
echo "Checking if Markdown Linter is installed..."
if command_exists markdownlint; then
    echo "Markdownlint is already installed."
else
    echo "Installing Markdown Linter..."
    npm install -g markdownlint-cli
fi

# Install C Linter (gcc)
echo "Checking if GCC (C Linter) is installed..."
if command_exists gcc; then
    echo "GCC is already installed."
else
    echo "Installing GCC (for C)..."
    apt-get install gcc  # For Debian-based systems
    # brew install gcc          # For macOS
fi

# Install G++ Linter (g++)
echo "Checking if G++ (C++ Linter) is installed..."
if command_exists g++; then
    echo "G++ is already installed."
else
    echo "Installing G++ (for C++)..."
    apt-get install g++  # For Debian-based systems
    # brew install gcc          # For macOS
fi

# Install Go Linter (go fmt)
echo "Checking if Go Linter is installed..."
if command_exists go; then
    echo "Go is already installed."
else
    echo "Installing Go Linter..."
    apt-get install golang-go  # For Debian-based systems
    # brew install go             # For macOS
fi

# Install Ruby Linter (ruby -c)
echo "Checking if Ruby is installed..."
if command_exists ruby; then
    echo "Ruby is already installed."
else
    echo "Installing Ruby..."
    apt-get install ruby  # For Debian-based systems
    # brew install ruby         # For macOS
fi

# Install PHP Linter (php -l)
echo "Checking if PHP is installed..."
if command_exists php; then
    echo "PHP is already installed."
else
    echo "Installing PHP..."
    apt-get install php  # For Debian-based systems
    # brew install php          # For macOS
fi

# Install Perl Linter (perl -c)
echo "Checking if Perl is installed..."
if command_exists perl; then
    echo "Perl is already installed."
else
    echo "Installing Perl..."
    apt-get install perl  # For Debian-based systems
    # brew install perl         # For macOS
fi

# Install Rust Linter (rustc --check)
echo "Checking if Rust is installed..."
if command_exists rustc; then
    echo "Rust is already installed."
else
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  # Install Rust
fi

# All done!
echo "All linters have been installed!"

