module.exports = {
  config: {
    // Choose either "stable" for receiving highly polished,
    // or "canary" for less polished but more frequent updates.
    updateChannel: 'stable',

    // Default font size in pixels for all tabs.
    fontSize: 15,
    fontWeight: 600,
    // Font family with optional fallbacks.
    fontFamily: '"Operator Mono", "Fira Code" ,monospace',
    foregroundColor: '#FAD000',

    backgroundColor: '#1E1D40',
    // Terminal cursor background color and opacity (hex, srgb, hsl, hsv, hwb or cmyk).
    cursorColor: '#FAD000',
    cursorAccentColor: '#b362ff50',
    selectionColor: '#b362ff30',
    borderColor: '#b362ff',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █.
    cursorShape: 'BEAM',

    // Set to true for blinking cursor.
    cursorBlink: false,

    // Custom css to embed in the main window.
    css: `
      .term_fit:not(.term_term) {
        opacity: 1 !important
      }
      .terminal: not(.focus) {
        opacity: 1;
        }
      .terminal.focus {
        opacity: 1;
      }
    `,

    // custom css to embed in the terminal window
    termCSS: '',

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',


    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // Powershell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '',

    // For setting shell arguments (i.e. for using interactive shellArgs: ['-i']).
    // by default ['--login'] will be used.
    shellArgs: ['--login'],

    // For environment variables.
    env: {},

    // Set to false for no bell.
    bell: false,

    // If true, selected text will automatically be copied to the clipboard.
    copyOnSelect: false,

    // For advanced config flags please refer to https://hyper.is/#cfg
    hyperBorder: {
      // animate: {
      // 	duration: '0.2s' // default is 16s
      // },
      // borderColors: ['#FF2C70', '#5D3DE1', '#fad000', '#6937FF'],
      borderColors: ['#FF2C70', '#6937FF'],
      borderWidth: '3px'
    }
  },
  // Hyper plugins.
  plugins: ['hyper-snazzy', 'hyperlinks', 'hyperborder', 'shades-of-purple-hyper'],
};
