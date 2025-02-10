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
# Custom format
format = """
[┌───────────────────](bold green)
[│](bold green)$directory$rust$package
[└─>](bold green) """

# Show command duration
[command_duration]
min_time = 500
show_milliseconds = true

# Custom prompt character (Because ➜ > $)
[character]
success_symbol = "[➜](bold green)"
error_symbol = "[✗](bold red)"
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

