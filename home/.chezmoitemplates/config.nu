# ********************************************************
# Config by ankddev - https://ankddev.vercel.app
# You will need to install some utils - see in the source
# ********************************************************

# Set default editor to nvim
$env.config.buffer_editor = "nvim"
$env.EDITOR = "nvim"
# $env.config.buffer_editor = "hx"
# $env.EDITOR = "hx"
$env.config.show_banner = false
$env.config.use_kitty_protocol = true
$env.config.display_errors.exit_code = true
$env.config.render_right_prompt_on_last_line = true
$env.config.history.max_size = 1_000_000_000
$env.config.edit_mode = 'vi'
# Hack to work properly in Wezterm
$env.config.shell_integration = {
    osc133: false
}

# {{ if eq .chezmoi.os "windows" -}} File previews in Yazi on Windows
$env.YAZI_FILE_ONE = "C:\\Program Files\\Git\\usr\\bin\\file.exe"
# {{- end }}

# Create autoload dir, if it isn't already
mkdir ($nu.data-dir | path join "vendor/autoload")

# -------------------------
# Completions with carapace
# -------------------------

let completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}

let external_completer = {|spans|
    let carapace_completer = {|spans|
        carapace $spans.0 nushell ...$spans
        | from json
        | if ($in | default [] | where value == $"($spans | last)ERR" | is-empty) { $in } else { null }
    }

    let expanded_alias = scope aliases | where name == $spans.0 | get -o 0 | get -o expansion
    let spans = if $expanded_alias != null  {
        $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
    } else {
        $spans
    }

    match $spans.0 {
        _ => $carapace_completer
    } | do $in $spans
}

$env.config.completions.external = {
    enable: true
    completer: $external_completer
}

# -------
# Aliases
# -------

alias cat = bat --paging never
alias cacl = cargo clean
alias ofh = onefetch --nerd-fonts
alias rpy = rustpython
alias zz = zed .
alias nv = nvim

# --------
# Commands
# --------

# Simple utility to check if something runs successfully (exit code 0)
def is-success [closure: closure] {
    do $closure | complete | get exit_code == 0
}

# Unlock Bitwarden vault via CLI
def --env bwu [] {
    let pass = (python -c "import keyring; print(keyring.get_password('Bitwarden', '{{ .email }}'))" | str trim)
    if ($pass == "None" or ($pass | is-empty)) {
        error make {msg: $"Password not found in keyring! Please execute `python -c \"import keyring; keyring.set_password\('Bitwarden', '<email>', '<pass>'\)\"`"}
    }

    let session = (bw unlock $pass --raw)

    if ($env | get -o BW_SESSION | is-not-empty) {
        $env.BW_SESSION = $session
        print "Bitwarden session updated!"
    } else {
        $env.BW_SESSION = $session
        print "Bitwarden unlocked!"
    }
}

# Request info from ifconfig.me
def myip [] {
    http get https://ifconfig.me/all | from json
}

# Cargo with cranelift backend (nightly)
#
# It was created because there was no way to provide different options for stable and nightly,
# leading in errors on stable.
def --wrapped cargolift [...args] {
    with-env {
        CARGO_PROFILE_DEV_CODEGEN_BACKEND: "cranelift"
    } {
        ^cargo +nightly -Zcodegen-backend ...$args
    }
}

# Go to with Yazi
def --env --wrapped y [...args] {
    let tmp = (mktemp -t "yazi-cwd.XXXXXX")
    yazi ...$args --cwd-file $tmp
    let cwd = (open $tmp)
    if $cwd != "" and $cwd != $env.PWD {
        cd $cwd
    }
    rm -fp $tmp
}

# Select file with fzf and print it with cat (bat)
def caf [] {
    try {
        let file = (fzf)
        cat $file
    } catch {
        print "Something went wrong!"
    }
}

# (git) Show histogram of commiters
def "git histogram" [] {
    git log --pretty=%h»¦«%aN»¦«%s»¦«%aD | lines | split column "»¦«" sha1 committer desc merged_at | histogram committer merger | sort-by merger | reverse
}

# Create directory and cd into it
def --env mcd [
    name: path # Name of directory
    -v         # Print name of created directory
] {
    if $v {
        mkdir -v $name
    } else {
        mkdir $name
    }
    cd $name
}

# git pull ~upstream~ ~main~ --rebase
def "git pumr" [ remote = "upstream", branch = "main" ] {
    # It's defined as a shell function instead of Git alias, since I need to substitute
    # argument, which isn't possible in Git aliases
    git pull $remote $branch --rebase
}

# Prints the top `n` most used commands present in `nushell/history.txt`.
def top [ n = 10] {
    if $nu.history-enabled {
        open $nu.history-path | lines | uniq --count | sort-by --reverse count | first $n | rename Command Amount
    } else {
        print --stderr "History is disabled!"
    }
}

# ------------------------------
# External commands improvements
# ------------------------------

def "cargo search" [ query: string, --limit=10 ] {
    ^cargo search $query --limit $limit
    | lines
    | each {
        |line| if ($line | str contains "#") {
            $line | parse --regex '(?P<name>.+) = "(?P<version>.+)" +# (?P<description>.+)'
        } else {
            $line | parse --regex '(?P<name>.+) = "(?P<version>.+)"'
        }
    }
    | flatten
}

# ---------------------------
# Load Catppuccin Mocha theme
# ---------------------------

source ($nu.default-config-dir | path join "catppuccin.nu")

# --------------
# Setup starship
# --------------

starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
