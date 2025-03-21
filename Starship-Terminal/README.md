# 🚀 Starship: The Coolest Prompt in the Universe 🌌  

Tired of your terminal looking like it was designed in the Stone Age? Want a sleek, ultra-fast, and **N E R D Y** prompt that makes your shell feel like a spaceship control panel? Well, buckle up, because **Starship** is here to launch your command line into the future! 🚀  

---

## 🎩 Prerequisites (a.k.a. Stuff You Need)  

- A **terminal emulator** (duh)  
- **Git** (because why not?)  
- A **package manager** (`apt`, `brew`, `winget`, or just sheer willpower)  

---

## 🛠 Installation Steps (a.k.a. How to Join the Cool Kids)  

### 1️⃣ Install Starship  

#### 🐧 On Linux/macOS  
```bash
curl -sS https://starship.rs/install.sh | sh
```
(*Fun fact: This command is so fast that by the time you blink, it's probably done.*)  

#### 🪟 On Windows (with winget, because why not?)  
```powershell
winget install starship
```
(*If you’re using Windows, we respect your bravery.*)  

---

### 2️⃣ Install a Nerd Font (because aesthetics matter)  

Without a **Nerd Font**, your terminal will look like a broken ASCII art project. So let’s fix that.  

🔥 **I personally use FiraCode Nerd Font because it's smooth as butter:**  
[📥 Download FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip)  

1. Extract the downloaded `.zip` file  
2. Install the font files:  
   - **🪟 Windows**: Double-click each `.ttf` file and click "Install"  
   - **🍏 macOS**: Double-click the font files and click "Install Font"  
   - **🐧 Linux**: Copy the font files to `~/.local/share/fonts/` and run:  
     ```bash
     fc-cache -f -v
     ```  
     (*Because Linux users love typing cryptic commands.*)  

---

### 3️⃣ Configure Your Shell (a.k.a. Tell Starship to Take Over)  

#### 🐚 Bash  
Add this to `~/.bashrc`:  
```bash
eval "$(starship init bash)"
```

#### 💫 Zsh (a.k.a. The Shell of the Elite)  
Add this to `~/.zshrc`:  
```bash
eval "$(starship init zsh)"
```

#### 🐟 Fish (Not an Actual Fish, Just a Shell)  
Add this to `~/.config/fish/config.fish`:  
```bash
starship init fish | source
```

#### 🪟 PowerShell (Yes, This Works Too)  
Add this to your PowerShell profile:  
```powershell
Invoke-Expression (&starship init powershell)
```

🔄 **Restart your terminal** and BOOM 💥, your prompt is now sleeker than ever!  

---

### 4️⃣ Set Your Terminal Font (Otherwise, It’ll Look Weird)  

Make sure your terminal emulator is using **FiraCode Nerd Font** (or else you’ll see strange boxes instead of icons).  

**Where to find this magical setting?**  

- **VS Code**: Open `settings.json` and add:  
  ```json
  "terminal.integrated.fontFamily": "FiraCode Nerd Font"
  ```
- **Windows Terminal**: Settings -> Profile -> Appearance -> Font face  
- **iTerm2 (macOS)**: Profiles -> Text -> Font  
- **GNOME Terminal (Linux)**: Preferences -> Profile -> Custom font  

(*Yes, I just saved you from Googling this. You’re welcome.*)  

---

## 🎨 Customizing Starship (Because Default is Boring)  

Want your prompt to look even cooler? Create a config file at `~/.config/starship.toml`:  

```toml
format = """
[](#9A348E)\
$os\
$username\
[](bg:#DA627D fg:#9A348E)\
$directory\
[](fg:#DA627D bg:#FCA17D)\
$git_branch\
$git_status\
[](fg:#FCA17D bg:#86BBD8)\
$c\
$elixir\
$elm\
$golang\
$gradle\
$haskell\
$java\
$julia\
$nodejs\
$nim\
$rust\
$scala\
[](fg:#86BBD8 bg:#06969A)\
$docker_context\
[](fg:#06969A bg:#33658A)\
$time\
[ ](fg:#33658A)\
"""

# Disable the blank line at the start of the prompt
# add_newline = false

# You can also replace your username with a neat symbol like   or disable this
# and use the os module below
[username]
show_always = true
style_user = "bg:#9A348E"
style_root = "bg:#9A348E"
format = '[$user ]($style)'
disabled = false

# An alternative to the username module which displays a symbol that
# represents the current operating system
[os]
style = "bg:#9A348E"
disabled = true # Disabled by default

[directory]
style = "bg:#DA627D"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

# Here is how you can shorten some long paths by text replacement
# similar to mapped_locations in Oh My Posh:
[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = " "
"Pictures" = " "
# Keep in mind that the order matters. For example:
# "Important Documents" = " 󰈙 "
# will not be replaced, because "Documents" was already substituted before.
# So either put "Important Documents" before "Documents" or use the substituted version:
# "Important 󰈙 " = " 󰈙 "

[c]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[docker_context]
symbol = " "
style = "bg:#06969A"
format = '[ $symbol $context ]($style)'

[elixir]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[elm]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[git_branch]
symbol = ""
style = "bg:#FCA17D"
format = '[ $symbol $branch ]($style)'

[git_status]
style = "bg:#FCA17D"
format = '[$all_status$ahead_behind ]($style)'

[golang]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[gradle]
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[haskell]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[java]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[julia]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[nodejs]
symbol = ""
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[nim]
symbol = "󰆥 "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[rust]
symbol = ""
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[scala]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[time]
disabled = false
time_format = "%R" # Hour:Minute Format
style = "bg:#33658A"
format = '[ ♥ $time ]($style)'
```

This setup will:  
✅ Show your directory in **bold green**  
✅ Add Rust and package info (because we love programming)  
✅ Show command duration (so you can flex how fast your machine is)  
✅ Replace the boring `$` with a fancy green `➜`  

If you want more tweaks, check out the full **[Starship Config Guide](https://starship.rs/config/)**.  

---

## 🏆 Troubleshooting (a.k.a. “Why Does It Look Weird?”)  

If your terminal is showing **weird symbols** or **boxes instead of icons**, try these fixes:  

1️⃣ **Make sure you installed the Nerd Font properly** (Go back and read Step 2 again, I believe in you 🙃)  
2️⃣ **Check if your terminal is using the Nerd Font** (See Step 4)  
3️⃣ **Restart your terminal** (Because sometimes turning it off and on again actually works)  

---

## 🌍 Additional Resources (a.k.a. Where to Learn More)  

🔗 [Starship Documentation](https://starship.rs/guide/)  
🔗 [Nerd Fonts Repository](https://github.com/ryanoasis/nerd-fonts)  
🔗 [FiraCode Font Documentation](https://github.com/tonsky/FiraCode)  

---

## 🎉 Congratulations! You Did It!  

Your terminal is now **faster, prettier, and nerdier** than ever!  

👨‍💻 Now go forth and impress your friends with your **galaxy-tier** terminal setup!  
😎 🚀  

