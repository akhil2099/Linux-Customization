# 🚀 Starship: The Fast, Customizable, and Nerdy Prompt 🚀  

So, you’re here because you want a **cool terminal prompt** that doesn’t look like it was designed in the 80s? Well, **Starship** is here to save the day!  

With **lightning-fast performance**, **endless customization**, and **a sleek design**, Starship will make your terminal look and feel like a futuristic control center. Buckle up, because we’re about to launch your command line to the next level! 🚀  

---

## 🌟 Why Starship?  

- 💨 **Blazing Fast** – You won’t even notice it’s running. Seriously.  
- 🎨 **Highly Customizable** – Make it look exactly how you want. Your terminal, your rules.  
- 💻 **Works Everywhere** – Bash, Zsh, Fish, and even Windows (yes, Windows users, we see you 👀).  
- 🛠 **Minimal & Functional** – It only shows what you need, when you need it.  

---

## 🔧 Installation  

### 1️⃣ Install Starship  

Open your terminal and run:  

```sh
curl -sS https://starship.rs/install.sh | sh

For Fedora users (because we like fancy package managers 😉):

sudo dnf install starship

For Debian/Ubuntu users:

sudo apt install starship

For Arch users (you legends):

sudo pacman -S starship

For macOS (with Homebrew):

brew install starship

For Windows (if you must):

scoop install starship

2️⃣ Install a Nerd Font (because aesthetics matter)

You don’t want weird symbols showing up as squares, right? Right.

🔥 I personally use FiraCode Nerd Font, and it looks amazing for programming:

📥 Download FiraCode Nerd Font

After downloading, install the font and set it as your terminal font.

Alternatively, you can check out the full list of Nerd Fonts here:
🔗 Nerd Fonts Repo
3️⃣ Add Starship to Your Shell

For Bash, add this to your ~/.bashrc:

eval "$(starship init bash)"

For Zsh, add this to your ~/.zshrc:

eval "$(starship init zsh)"

For Fish, add this to your ~/.config/fish/config.fish:

starship init fish | source

For PowerShell, add this to your $PROFILE:

Invoke-Expression (&starship init powershell)

Once added, restart your terminal, and BOOM 💥, Starship is now in control!
🎨 Customizing Starship

Want your prompt to match your vibe? Open ~/.config/starship.toml and start tweaking!

Here’s a simple example:

# ~/.config/starship.toml

format = """$username@$hostname $directory$git_branch$git_status$nodejs$rust$python$time
$character"""

[username]
show_always = true
style_user = "bold green"
style_root = "bold red"

[hostname]
ssh_only = false
style = "bold blue"

[directory]
truncation_length = 3
style = "bold cyan"

[time]
disabled = false
format = "[$time]($style) "
style = "bold yellow"

This will make your prompt:
✅ Show your username and hostname
✅ Display the current directory in cyan
✅ Show the current time in yellow
✅ Add Git, Node.js, Rust, and Python details (when relevant)

If you want more inspiration, check out:
🔗 Starship Config Examples
🏆 You Did It!

Congratulations, your terminal is now faster, prettier, and smarter than ever! 🎉

Now go forth and flex your new terminal setup!
😎 🚀
