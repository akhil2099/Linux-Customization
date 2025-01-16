
---

# Syntax Check & Linter Party 🎉

Welcome to the most **spell-checking, syntax-slashing, error-busting** party your code has ever seen! 🥳

This script does one thing, and it does it **gloriously**: **Checking Syntax**. That's right! No more digging through code like it's a mystery novel. We check all the things, with all the tools, and maybe even a few secret surprises. 🔍✨

## 🎯 What is this?

This magical function, `syntax_check()`, is your **code’s best friend**. It ensures your code isn’t secretly plotting against you with bugs, missed semicolons, or misplaced parentheses. From Bash to Python to Go to Java to... well, pretty much everything that has a syntax, this function checks it!

## 🧙‍♂️ Features

- **Syntax Highlighting** 🖍: See your code in glorious color with `batcat`!
- **Language-Specific Checks**: Got shell scripts? Python? JS? TypeScript? We’ve got you covered. Even your obscure `.nxt` files! (Just kidding, we don’t check those… yet).
- **Detailed Error Messages**: Nothing is left unchecked, except maybe your coffee break 🍵.

## 🔧 The Tools You Need

We’ve packed this script with **cool linter tools**. But first, let’s make sure we have the right ones! From **ShellCheck** to **ESLint**, this script checks your code faster than you can say “syntax error”. 🚀

## 💻 How to Install

### Step 1: Clone This Script and Get Ready to Be Amazed

```bash
git clone https://github.com/Terminal-Customization/Shell-Check.git
cd Shell-Check
```

### Step 2: Run the Linters Setup

The `linters.sh` script checks if you have all the necessary tools installed. No tool? No problem! It installs everything for you! (Except your coffee, but if you want, we could add that too. ☕)

Run it:

```bash
sudo ./linters.sh
```

Now your system will be more lined up than your last family reunion photo. 📸


### Step 3: Customize your .zshrc or .bashrc file

copy pasta:

```bash
function syntax_check() {
    local file="$1"
    batcat --paging=never "$file"  # Display the file with syntax highlighting

    case "$file" in
	*.sh)
            shellcheck "$file"  # Syntax check for bash scripts
            ;;
        *.py) 
            python -m py_compile "$file" 
            ;;
        *.js | *.jsx) 
            eslint "$file" 
            ;;
        *.ts | *.tsx) 
            eslint "$file" || tsc --noEmit "$file" 
            ;;
        *.html) 
            tidy -q -e "$file" 
            ;;
        *.yaml | *.yml) 
            yamllint "$file" 
            ;;
        *.json) 
            jq . "$file" > /dev/null || echo "Invalid JSON syntax" 
            ;;
        *.css | *.scss | *.sass) 
            stylelint "$file" 
            ;;
        *.java) 
            javac "$file" 
            ;;
        Dockerfile) 
            hadolint "$file" 
            ;;
        Jenkinsfile) 
            groovy "$file" 
            ;;
        *.sh) 
            shellcheck "$file" 
            ;;
        *.md) 
            markdownlint "$file" 
            ;;
        *.c) 
            gcc -fsyntax-only "$file" 
            ;;
        *.cpp) 
            g++ -fsyntax-only "$file" 
            ;;
        *.go) 
            go fmt "$file" > /dev/null || echo "Syntax error in Go file" 
            ;;
        *.rb) 
            ruby -c "$file" 
            ;;
        *.php) 
            php -l "$file" 
            ;;
        *.pl) 
            perl -c "$file" 
            ;;
        *.rs) 
            rustc --check "$file" 
            ;;
        *.nxt) 
            echo "Custom syntax check for .nxt files not implemented" 
            ;;
        *) 
            echo "No syntax check available for this file type" 
            ;;
    esac
}
alias check=syntax_check

```


### Step 4: Use `syntax_check()`

Run the magic function:

```bash
check path/to/your/codefile
```

It’s like having a personal bodyguard for your code. 💪

---

## 🎉 What Does `syntax_check()` Do?

**It’s like a Swiss Army knife, but for your code**. Here's what happens:

- **Bash files**? 💥 ShellCheck will slap them into shape.
- **Python files**? 🐍 `py_compile` will give you a thumbs up (or down if it’s not happy).
- **JavaScript/TypeScript**? 📜 You’ve got ESLint and TypeScript linting coming for you.
- **HTML/CSS/JS/JSON**? ✅ It checks everything, even your **.json** files. Don't worry, that extra comma isn't getting past us!
- **Dockerfiles**? 🐳 Hadolint will evaluate your Docker wisdom.
- **Jenkinsfiles**? 🛠 Groovy handles them like a champ.

### Here's a list of all the fun file types we support (and what happens when you send them our way):

| File Type   | What Happens                                  |
|-------------|-----------------------------------------------|
| `.sh`       | **ShellCheck** runs, because no one wants bash bugs. |
| `.py`       | **Python** gets the `py_compile` treatment. 💻 |
| `.js` / `.jsx` | **ESLint** checks your JS, because no one wants their code to be a mess. |
| `.ts` / `.tsx` | **TypeScript** will lint your life away. |
| `.html`     | **Tidy** tidies up your HTML like a pro. 💅 |
| `.css` / `.scss` | **Stylelint** says, “Your CSS is too beautiful to mess up.” 🌟 |
| `.yaml` / `.yml` | **yamllint** keeps your YAML clean. 🙌 |
| `.json`     | **jq** keeps your JSON neat, not a single extra comma allowed. |
| `.java`     | **javac** makes sure you’re running on all cylinders. |
| Dockerfile  | **Hadolint** evaluates your Docker skills, no Docker mishaps allowed! |
| **and more...** | We lint more than just a checklist! |

---

## 🤖 Trouble with Your Linter?

**Got errors?** Don’t panic! Here’s what to do:

1. **Is the tool installed?**
   - If not, our `linters.sh` script will handle it! 🚀
2. **Is your file supported?**
   - If we don’t check it... then **send us a PR** (or at least a strongly worded email). 📧
3. **Is your code perfect yet?**
   - It probably is now, but you can try again. Perfection is just one syntax error away. 🔄

---

## 🍻 Contribute

- Found a bug? **Fix it!** (Or, you know, leave a bug report. Your choice).
- Want to add another linter? **Pull Request!**
- Just want to give a shoutout? **We accept high fives.**

---

## 🎨 License

This script is **licensed** under the **MIT License**. So, use it, enjoy it, and pass it on! Just don’t take credit for our bad jokes. 😉

---

*Last updated: [We fixed some bugs, but probably added more].*
